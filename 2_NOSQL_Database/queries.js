





db.electronics.aggregate([
    {
      $match: { type: "smart phone" } 
    },
    {
      $group: {
        _id: "$type", 
        averageScreenSize: { $avg: "$screen size" } 
      }
    }
  ]).pretty()
  