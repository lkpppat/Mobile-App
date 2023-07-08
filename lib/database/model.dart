
class Pets {
   String name;
   String age;
   String sex;
   String blood;
   String pet;
   String gene;
   String moredetails;
   int vaccine;
   String? referenceId;
 
  static const collectionName = 'pets';
  static const colName = 'name';
  static const colage = 'age';
  static const colsex = 'sex';
  static const colblood = 'blood';
  static const colpet = 'pet';
  static const colgene = 'gene';
  static const colmoredetails = 'moredetails';
  static const colvaccine = 'vaccine';


  Pets({
    required this.name,
    required this.age,
    required this.sex,
    required this.blood,
    required this.pet,
    required this.gene,
    required this.moredetails,
    required this.vaccine,
    this.referenceId
  });

  Map<String, dynamic> toMap() {
    var mapData = <String, dynamic> {
      colName : name,
      colage : age,
      colsex : sex,
      colblood : blood,
      colpet : pet,
      colgene : gene,
      colmoredetails : moredetails,
      colvaccine : vaccine
    };
    return mapData;
  }
  Map<String, dynamic> toJson() {
    var jsonData = <String, dynamic> {
      colName : name,
      colage : age,
      colsex : sex,
      colblood : blood,
      colpet : pet,
      colgene : gene,
      colmoredetails : moredetails,
      colvaccine : vaccine
    };
    return jsonData;
  }
}

class Heal {
   String name;
   String slogan;
   String link;


 
  static const collectionName = 'heal';
  static const colName = 'name';
  static const colslogan = 'slogan';
  static const collink = 'link';



  Heal({
    required this.name,
    required this.slogan,
    required this.link,
   
  });

  Map<String, dynamic> toMap() {
    var mapData = <String, dynamic> {
      colName : name,
      colslogan : slogan,
      collink : link,
    };
    return mapData;
  }
  Map<String, dynamic> toJson() {
    var jsonData = <String, dynamic> {
      colName : name,
      colslogan : slogan,
      collink : link,
    };
    return jsonData;
  }
}
