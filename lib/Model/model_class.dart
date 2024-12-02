class Planet {
  final String position;
  final String name;
  final String subtitle;
  final String image;
  final String velocity;
  final String distance;
  final String description;
  final String length_of_day;
  final String orbital_period;
  final String gravity;
  final String surface_area;

  Planet({
    required this.position,
    required this.name,
    required this.image,
    required this.velocity,
    required this.distance,
    required this.subtitle,
    required this.description,
    required this.length_of_day,
    required this.orbital_period,
    required this.gravity,
    required this.surface_area,
  });

  factory Planet.fromJson(Map json) {
    return Planet(
      position: json['position'],
      name: json['name'],
      subtitle: json['subtitle'],
      image: json['image'],
      velocity: json['velocity'],
      distance: json['distance'],
      description: json['description'],
      gravity: json['gravity'],
      length_of_day: json['length_of_day'],
      orbital_period: json['orbital_period'],
      surface_area: json['surface_area']
    );
  }
}
