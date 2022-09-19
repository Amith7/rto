from sqlite3 import adapters
from xml.etree.ElementTree import register_namespace
from django.shortcuts import redirect, render
import pymysql
from django.http import HttpResponse, HttpResponseRedirect
from django.core.files.storage import FileSystemStorage


# Create your views here.
db = pymysql.connect(host="localhost", user="root",
                     password="", database="rto")
c = db.cursor()


def index(request):
    return render(request, "index.html")


def login(request):
    msg = ""
    if request.method == "POST":
        email = request.POST["email"]
        pwd = request.POST["password"]
        s = f"select count(*) from tbl_login where username='{email}'"
        c.execute(s)
        i = c.fetchone()
        if(i[0] > 0):
            s = f"select * from tbl_login where username='{email}'"
            c.execute(s)
            i = c.fetchone()
            if(i[2] == pwd):
                request.session['email'] = email
                if(i[4] == "1"):
                    if(i[3] == "admin"):
                        return HttpResponseRedirect("/adminhome")
                    elif(i[3] == "rto"):
                        s = f"select * from tbl_rto where email='{email}'"
                        print(s)
                        c.execute(s)
                        d = c.fetchone()
                        print(d)
                        request.session['id'] = d[0]
                        return HttpResponseRedirect("/rtohome")
                    elif(i[3] == "customer"):
                        s = f"select * from tbl_veh_reg where email='{email}'"
                        c.execute(s)
                        d = c.fetchone()
                        request.session['id'] = d[0]
                        return HttpResponseRedirect("/userHome")

                elif(i[3] == "inactive"):
                    msg = "Your registration is incomplete. Please register"
                else:
                    msg = "You are not authenticated to login"
            else:
                msg = "Incorrect password"
        else:
            msg = "User doesnt exist"
    return render(request, "login.html", {"msg": msg})


def adminhome(request):
    return render(request, "adminhome.html")


def adminAddRto(request):
    if request.method == "POST":
        name = request.POST['name']
        email = request.POST['email']
        phone = request.POST['phone']
        adrs = request.POST['adrs']
        designation = request.POST['designation']
        qry = f"INSERT INTO `tbl_rto`(`name`,`address`,`mobile`,`designation`,`email`)  VALUES ('{name}','{adrs}','{phone}','{designation}','{email}')"
        c.execute(qry)
        db.commit()
        qrylog = f"INSERT INTO `tbl_login`(`username`,`password`,`usertype`,`status`) VALUES ('{email}','{phone}','rto','1')"
        c.execute(qrylog)
        db.commit()
        return redirect("/adminAddRto")
    else:
        qry = "SELECT * FROM `tbl_rto`"
        c.execute(qry)
        data = c.fetchall()
        return render(request, "adminAddRto.html", {"data": data})


def adminAddVehicle(request):
    if request.method == "POST":
        name = request.POST['name']
        brand = request.POST['brand']
        model = request.POST['model']
        capacity = request.POST['capacity']
        fuel = request.POST['fuel']
        tax = request.POST['tax']
        qry = f"INSERT INTO `tbl_veh_preg` (`vehiclename`,`brand`,`capacity`,`fuel`,`model`,`tax`) VALUES ('{name}','{brand}','{capacity}','{fuel}','{model}','{tax}')"
        c.execute(qry)
        db.commit()
        return redirect("/adminAddVehicle")
    else:
        qry = "SELECT * FROM `tbl_veh_preg`"
        c.execute(qry)
        data = c.fetchall()
        return render(request, "adminAddVehicle.html", {"data": data})


def adminVehicleOwner(request):
    qry = "SELECT * FROM `tbl_veh_reg` vr, `tbl_veh_preg` vp WHERE vr.`vehicle_id`=vp.`vehicle_id`"
    c.execute(qry)
    data = c.fetchall()
    return render(request, "adminVehicleOwner.html", {"data": data})


def rtohome(request):
    return render(request, "rtohome.html")


def rtoVehicleOwnerReg(request):
    if request.method == "POST":
        name = request.POST['name']
        email = request.POST['email']
        phone = request.POST['phone']
        adrs = request.POST['adrs']
        date = request.POST['date']
        regno = request.POST['regno']
        vid = request.POST['vid']
        qry = f"INSERT INTO `tbl_veh_reg`(`vehicle_id`,`regno`,`renewal_date`,`customername`,`contact`,`email`,`address`) VALUES ('{vid}','{regno}','{date}','{name}','{phone}','{email}','{adrs}')"
        c.execute(qry)
        db.commit()
        qrylog = f"INSERT INTO `tbl_login`(`username`,`password`,`usertype`,`status`) VALUES ('{email}','{phone}','customer','1')"
        c.execute(qrylog)
        db.commit()
        return redirect("/rtoVehicleOwnerReg")
    else:
        qry = "SELECT * FROM `tbl_veh_reg` vr, `tbl_veh_preg` vp WHERE vr.`vehicle_id`=vp.`vehicle_id`"
        c.execute(qry)
        data = c.fetchall()
        qryVeh = "SELECT * FROM `tbl_veh_preg`"
        c.execute(qryVeh)
        vehicles = c.fetchall()
        return render(request, "rtoVehicleOwnerReg.html", {"data": data, "vehicles": vehicles})


def rtoAddLicenseDetails(request):
    if request.method == "POST":
        licnum = request.POST['licnum']
        date = request.POST['date']
        dob = request.POST['dob']
        blood = request.POST['blood']
        vid = request.POST['vid']
        qry = f"INSERT INTO `tbl_license` (`user`,`dob`,`expdate`,`bloodgrp`,`lice_num`,`status`) VALUES ('{vid}','{dob}','{date}','{blood}','{licnum}','1')"
        c.execute(qry)
        db.commit()
        return redirect("/rtoAddLicenseDetails")
    else:
        qry = "SELECT * FROM `tbl_veh_reg`"
        c.execute(qry)
        data = c.fetchall()
        qryLic = f"SELECT * FROM `tbl_license` l, `tbl_veh_reg` v WHERE l.`user`=v.`vid`"
        c.execute(qryLic)
        details = c.fetchall()
        return render(request, "rtoAddLicenseDetails.html", {"data": data, "details": details})


def userHome(request):
    email = request.session['email']
    qry = f"SELECT * FROM `tbl_veh_reg` WHERE `email`='{email}'"
    c.execute(qry)
    data = c.fetchone()
    return render(request, "userHome.html", {"data": data})
