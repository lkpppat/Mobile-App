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