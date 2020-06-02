class FeedData {
  String userImageLink;
  int stars;
  String userName;
  String destination;
  String dateTime;
  String description;
  String seatsAvailable;
  String vehicleName;
  String estimatedAmount;
  FeedData({this.userImageLink,this.estimatedAmount,this.destination,this.stars,this.userName,this.dateTime,this.description,this.seatsAvailable,this.vehicleName});
}

List<FeedData> dummyFeed = [
  FeedData(
    userName: "Haroon Awan",
    dateTime: "1h Ago",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis non ligula non eros gravida sagittis. Mauris quis vehicula dui, sed lobortis tortor. Nulla massa felis, dictum vitae pretium sed, interdum a justo. ",
    seatsAvailable: "2",
    vehicleName: "Prius",
    stars: 3,
    destination: 'Islamabad',
    estimatedAmount: '300',
    userImageLink: "https://scontent.fkhi6-1.fna.fbcdn.net/v/t1.0-9/55952452_2168848129895375_5864418164946763776_n.jpg?_nc_cat=111&_nc_oc=AQmaI7pQZ6xm6FHHCMOQlKgBIXMbi-tSYKCOnRFo1svgrl2zczk-lkG-4mErfVh19b8&_nc_ht=scontent.fkhi6-1.fna&oh=9f393a97fb823e1bbe82aae4ae797703&oe=5E3B460D"
  ),
  FeedData(
      userName: "Nabeel Rajpoot",
      dateTime: "3h Ago",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis non ligula non eros gravida sagittis. Mauris quis vehicula dui, sed lobortis tortor. Nulla massa felis, dictum vitae pretium sed, interdum a justo. ",
      seatsAvailable: "4",
      vehicleName: "Audi",
      stars: 3,
      destination: 'Lahore',
      estimatedAmount: '700',
      userImageLink: "https://www.google.com/s2/u/0/photos/public/AIbEiAIAAABECNXj2ez7hY7C5AEiC3ZjYXJkX3Bob3RvKigyYzdjNTY4N2M0Y2FmNTZiZmQyZjQ2NTFlNTNhYmFhMmZiODg0ZjQxMAGhsIlxUImk-3KCaKgXfoDGrd0gZg?sz=40"
  ),
  FeedData(
      userName: "Haroon Awan",
      dateTime: "1h Ago",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis non ligula non eros gravida sagittis. Mauris quis vehicula dui, sed lobortis tortor. Nulla massa felis, dictum vitae pretium sed, interdum a justo. ",
      seatsAvailable: "2",
      vehicleName: "Prius",
      stars: 3,
      destination: 'Islamabad',
      estimatedAmount: '300',
      userImageLink: "https://scontent.fkhi6-1.fna.fbcdn.net/v/t1.0-9/55952452_2168848129895375_5864418164946763776_n.jpg?_nc_cat=111&_nc_oc=AQmaI7pQZ6xm6FHHCMOQlKgBIXMbi-tSYKCOnRFo1svgrl2zczk-lkG-4mErfVh19b8&_nc_ht=scontent.fkhi6-1.fna&oh=9f393a97fb823e1bbe82aae4ae797703&oe=5E3B460D"
  ),

];