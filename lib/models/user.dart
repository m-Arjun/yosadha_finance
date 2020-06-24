
//converting firebase object into our own class object

class User {

final String uid,email,providerid,displayname,photourl,phn;
User({ this.uid ,this.displayname,this.email,this.providerid,this.phn,this.photourl});

}

class DatabaseUser{
  final String name,address,phone,aadhar,id;

  DatabaseUser(this.name, this.address, this.phone, this.aadhar, this.id);

}