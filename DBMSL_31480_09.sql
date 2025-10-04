//TODO: InsertOne Operations:
db.Student.insertOne({
  name: "Barry Sloan",
  roll_no: 1,
  branch: "CS",
  division: 2,
  contact_no: 6543891266,
  email: "barrysloan6@yahoo.com",
  address: "Florida",
  forte: ["CP", "Web Devlopment", "ML"],
  langs: ["C++", "Python", "JS"]
});

//! Output
//* {
//*   acknowledged: true,
//*   insertedIds: { '0': ObjectId('66fa6b74063663b14ea3839f') }
//*
//!

//TODO: InsertMany Operation
db.Student.insertMany([
  {
    name: "Simon Riley",
    roll_no: 2,
    branch: "IT",
    division: 5,
    contact_no: 5249957586,
    email: "simriley3423@icloud.com",
    address: "Texas",
    forte: ["CP", "Web Development"],
    langs: ["C", "C++", "Java", "JS"]
  },

  {
    name: "Soap Mactavish",
    roll_no: 6,
    branch: "CS",
    division: 2,
    contact_no: 3946475602,
    email: "soapmac@gmail.com",
    address: "LA",
    forte: ["ML", "Cyber Security", "OS"],
    langs: ["C++", "Python", "JS", "Ruby", "Java"]
  },
  {
    name: "Emma Flyte",
    roll_no: 18,
    branch: "CS",
    division: 2,
    contact_no: 4065542549,
    email: "flyteemma@hotmail.com",
    address: "Antwerp",
    forte: ["CP", "Web Development"],
    langs: ["C++", "Python", "JS", "TS"]
  },
  {
    name: "River Cartwright",
    roll_no: 20,
    branch: "CS",
    division: 2,
    contact_no: 7425401035,
    email: "barrysloan6@yahoo.com",
    address: "Katowice",
    forte: ["Web Development", "ML", "OS"],
    langs: ["C", "C++", "Python", "JS", "Fortran", "Java", "Turbo"]
  }
]);

//! Output
//* {
// *  acknowledged: true,
// *  insertedIds: {
// *    '0': ObjectId('66fa6eb7063663b14ea383a0'),
// *    '1': ObjectId('66fa6eb7063663b14ea383a1'),
// *    '2': ObjectId('66fa6eb7063663b14ea383a2'),
// *    '3': ObjectId('66fa6eb7063663b14ea383a3')
// *  }
// *}
//!

//TODO: Retrieval Operation
db.Student.find().pretty();

[
  {
    _id: ObjectId("66fa6b74063663b14ea3839f"),
    name: "Barry Sloan",
    roll_no: 1,
    branch: "CS",
    division: 2,
    contact_no: 6543891266,
    email: "barrysloan6@yahoo.com",
    address: "Florida",
    forte: ["CP", "Web Devlopment", "ML"],
    langs: ["C++", "Python", "JS"]
  },
  {
    _id: ObjectId("66fa6eb7063663b14ea383a0"),
    name: "Simon Riley",
    roll_no: 2,
    branch: "IT",
    division: 5,
    contact_no: 5249957586,
    email: "simriley3423@icloud.com",
    address: "Texas",
    forte: ["CP", "Web Development"],
    langs: ["C", "C++", "Java", "JS"]
  },
  {
    _id: ObjectId("66fa6eb7063663b14ea383a1"),
    name: "Soap Mactavish",
    roll_no: 6,
    branch: "CS",
    division: 2,
    contact_no: 3946475602,
    email: "soapmac@gmail.com",
    address: "LA",
    forte: ["ML", "Cyber Security", "OS"],
    langs: ["C++", "Python", "JS", "Ruby", "Java"]
  },
  {
    _id: ObjectId("66fa6eb7063663b14ea383a2"),
    name: "Emma Flyte",
    roll_no: 18,
    branch: "CS",
    division: 2,
    contact_no: 4065542549,
    email: "flyteemma@hotmail.com",
    address: "Antwerp",
    forte: ["CP", "Web Development"],
    langs: ["C++", "Python", "JS", "TS"]
  },
  {
    _id: ObjectId("66fa6eb7063663b14ea383a3"),
    name: "River Cartwright",
    roll_no: 20,
    branch: "CS",
    division: 2,
    contact_no: 7425401035,
    email: "barrysloan6@yahoo.com",
    address: "Katowice",
    forte: ["Web Development", "ML", "OS"],
    langs: ["C", "C++", "Python", "JS", "Fortran", "Java", "Turbo"]
  }
];

//TODO: Update operation
db.Student.update(
  { name: "Barry Sloan" },
  { $set: { forte: ["CP", "Web Development", "ML"] } }
);

//! Output
//* {
//*   acknowledged: true,
//*   insertedId: null,
//*   matchedCount: 1,
//*   modifiedCount: 1,
//*   upsertedCount: 0
//* }
//!

db.Student.insertOne({ name: "John Kennedy" });

//! Output
//* {
//*   acknowledged: true,
//*   insertedId: ObjectId('66fa6f99063663b14ea383a4')
//* }
//!

//TODO: Delete operation
db.Student.deleteOne({ name: "John Kennedy" });

//! Output
//* { acknowledged: true, deletedCount: 1 }
//!

//TODO: Logical 'AND' and 'IN' operation
db.Student.find({
  $and: [{ forte: { $in: ["CP"] } }, { langs: { $in: ["C++"] } }]
});

[
  {
    _id: ObjectId("66fa6b74063663b14ea3839f"),
    name: "Barry Sloan",
    roll_no: 1,
    branch: "CS",
    division: 2,
    contact_no: 6543891266,
    email: "barrysloan6@yahoo.com",
    address: "Florida",
    forte: ["CP", "Web Development", "ML"],
    langs: ["C++", "Python", "JS"]
  },
  {
    _id: ObjectId("66fa6eb7063663b14ea383a0"),
    name: "Simon Riley",
    roll_no: 2,
    branch: "IT",
    division: 5,
    contact_no: 5249957586,
    email: "simriley3423@icloud.com",
    address: "Texas",
    forte: ["CP", "Web Development"],
    langs: ["C", "C++", "Java", "JS"]
  },
  {
    _id: ObjectId("66fa6eb7063663b14ea383a2"),
    name: "Emma Flyte",
    roll_no: 18,
    branch: "CS",
    division: 2,
    contact_no: 4065542549,
    email: "flyteemma@hotmail.com",
    address: "Antwerp",
    forte: ["CP", "Web Development"],
    langs: ["C++", "Python", "JS", "TS"]
  }
];

//TODO: Logical 'OR' and Arithmetic 'Greater than' operation
db.Student.find({
  $or: [
    { forte: { $in: ["CP", "Web Development"] } },
    { contact_no: { $gt: 5000000000 } }
  ]
});

[
  {
    _id: ObjectId("66fa6b74063663b14ea3839f"),
    name: "Barry Sloan",
    roll_no: 1,
    branch: "CS",
    division: 2,
    contact_no: 6543891266,
    email: "barrysloan6@yahoo.com",
    address: "Florida",
    forte: ["CP", "Web Development", "ML"],
    langs: ["C++", "Python", "JS"]
  },
  {
    _id: ObjectId("66fa6eb7063663b14ea383a0"),
    name: "Simon Riley",
    roll_no: 2,
    branch: "IT",
    division: 5,
    contact_no: 5249957586,
    email: "simriley3423@icloud.com",
    address: "Texas",
    forte: ["CP", "Web Development"],
    langs: ["C", "C++", "Java", "JS"]
  },
  {
    _id: ObjectId("66fa6eb7063663b14ea383a2"),
    name: "Emma Flyte",
    roll_no: 18,
    branch: "CS",
    division: 2,
    contact_no: 4065542549,
    email: "flyteemma@hotmail.com",
    address: "Antwerp",
    forte: ["CP", "Web Development"],
    langs: ["C++", "Python", "JS", "TS"]
  },
  {
    _id: ObjectId("66fa6eb7063663b14ea383a3"),
    name: "River Cartwright",
    roll_no: 20,
    branch: "CS",
    division: 2,
    contact_no: 7425401035,
    email: "barrysloan6@yahoo.com",
    address: "Katowice",
    forte: ["Web Development", "ML", "OS"],
    langs: ["C", "C++", "Python", "JS", "Fortran", "Java", "Turbo"]
  }
];

//TODO: Sort Operation (ASC)
db.Student.find().sort({ name: 1 });

[
  {
    _id: ObjectId("66fa6b74063663b14ea3839f"),
    name: "Barry Sloan",
    roll_no: 1,
    branch: "CS",
    division: 2,
    contact_no: 6543891266,
    email: "barrysloan6@yahoo.com",
    address: "Florida",
    forte: ["CP", "Web Development", "ML"],
    langs: ["C++", "Python", "JS"]
  },
  {
    _id: ObjectId("66fa6eb7063663b14ea383a2"),
    name: "Emma Flyte",
    roll_no: 18,
    branch: "CS",
    division: 2,
    contact_no: 4065542549,
    email: "flyteemma@hotmail.com",
    address: "Antwerp",
    forte: ["CP", "Web Development"],
    langs: ["C++", "Python", "JS", "TS"]
  },
  {
    _id: ObjectId("66fa6eb7063663b14ea383a3"),
    name: "River Cartwright",
    roll_no: 20,
    branch: "CS",
    division: 2,
    contact_no: 7425401035,
    email: "barrysloan6@yahoo.com",
    address: "Katowice",
    forte: ["Web Development", "ML", "OS"],
    langs: ["C", "C++", "Python", "JS", "Fortran", "Java", "Turbo"]
  },
  {
    _id: ObjectId("66fa6eb7063663b14ea383a0"),
    name: "Simon Riley",
    roll_no: 2,
    branch: "IT",
    division: 5,
    contact_no: 5249957586,
    email: "simriley3423@icloud.com",
    address: "Texas",
    forte: ["CP", "Web Development"],
    langs: ["C", "C++", "Java", "JS"]
  },
  {
    _id: ObjectId("66fa6eb7063663b14ea383a1"),
    name: "Soap Mactavish",
    roll_no: 6,
    branch: "CS",
    division: 2,
    contact_no: 3946475602,
    email: "soapmac@gmail.com",
    address: "LA",
    forte: ["ML", "Cyber Security", "OS"],
    langs: ["C++", "Python", "JS", "Ruby", "Java"]
  }
];

//TODO: Sort Operation (DESC)
db.Student.find().sort({ roll_no: -1 });

[
  {
    _id: ObjectId("66fa6eb7063663b14ea383a3"),
    name: "River Cartwright",
    roll_no: 20,
    branch: "CS",
    division: 2,
    contact_no: 7425401035,
    email: "barrysloan6@yahoo.com",
    address: "Katowice",
    forte: ["Web Development", "ML", "OS"],
    langs: ["C", "C++", "Python", "JS", "Fortran", "Java", "Turbo"]
  },
  {
    _id: ObjectId("66fa6eb7063663b14ea383a2"),
    name: "Emma Flyte",
    roll_no: 18,
    branch: "CS",
    division: 2,
    contact_no: 4065542549,
    email: "flyteemma@hotmail.com",
    address: "Antwerp",
    forte: ["CP", "Web Development"],
    langs: ["C++", "Python", "JS", "TS"]
  },
  {
    _id: ObjectId("66fa6eb7063663b14ea383a1"),
    name: "Soap Mactavish",
    roll_no: 6,
    branch: "CS",
    division: 2,
    contact_no: 3946475602,
    email: "soapmac@gmail.com",
    address: "LA",
    forte: ["ML", "Cyber Security", "OS"],
    langs: ["C++", "Python", "JS", "Ruby", "Java"]
  },
  {
    _id: ObjectId("66fa6eb7063663b14ea383a0"),
    name: "Simon Riley",
    roll_no: 2,
    branch: "IT",
    division: 5,
    contact_no: 5249957586,
    email: "simriley3423@icloud.com",
    address: "Texas",
    forte: ["CP", "Web Development"],
    langs: ["C", "C++", "Java", "JS"]
  },
  {
    _id: ObjectId("66fa6b74063663b14ea3839f"),
    name: "Barry Sloan",
    roll_no: 1,
    branch: "CS",
    division: 2,
    contact_no: 6543891266,
    email: "barrysloan6@yahoo.com",
    address: "Florida",
    forte: ["CP", "Web Development", "ML"],
    langs: ["C++", "Python", "JS"]
  }
];

db.Student.aggregate([{ $group: { _id: "$roll_no" } }]);

db.Astronomer, insertOne({
  _id: ObjectId,
  fullName: "Chris Hadfield",
  nationality: "Canadian",
  birthDate: ISODate("1959-08-29"),
  missions: [
    {
      missionId: ObjectId, // Reference to Space_Missions
      role: "Commander"
    }
  ],
  totalSpaceHours: 1464, // Total time in space
  awards: ["Order of Canada", "NASA Exceptional Service Medal"],
  training: {
    trainingProgram: "CSA/NASA Astronaut Program",
    graduated: true,
    graduationDate: ISODate("1992-06-05")
  },
  bio: "First Canadian to command the International Space Station.",
  createdAt: ISODate,
  updatedAt: ISODate
});

db.Astronomer.insertMany([
  {
    _id: ObjectId,
    fullName: "Buzz Aldrin",
    nationality: "American",
    birthDate: ISODate("1930-01-20"),
    missions: [
      {
        missionId: ObjectId, // Reference to Space_Missions
        role: "Lunar Module Pilot"
      }
    ],
    totalSpaceHours: 289, // Total time in space
    awards: [
      "Presidential Medal of Freedom",
      "NASA Distinguished Service Medal"
    ],
    training: {
      trainingProgram: "Apollo Program",
      graduated: true,
      graduationDate: ISODate("1966-04-15")
    },
    bio: "Second human to step on the moon during the Apollo 11 mission.",
    createdAt: ISODate,
    updatedAt: ISODate
  },
  {
    _id: ObjectId,
    fullName: "Yuri Gagarin",
    nationality: "Russian",
    birthDate: ISODate("1934-03-09"),
    missions: [
      {
        missionId: ObjectId, // Reference to Space_Missions
        role: "Pilot"
      }
    ],
    totalSpaceHours: 1.8, // Total time in space
    awards: ["Hero of the Soviet Union", "Order of Lenin"],
    training: {
      trainingProgram: "Vostok Program",
      graduated: true,
      graduationDate: ISODate("1961-04-10")
    },
    bio: "First human in space aboard Vostok 1 on April 12, 1961.",
    createdAt: ISODate,
    updatedAt: ISODate
  }
]);

db.Student.insertOne({
  name: "Sofia Lopez",
  roll_no: 7,
  branch: "Data Science",
  division: 5,
  contact_no: 7890123456,
  email: "sofia.lopez@gmail.com",
  address: "Buenos Aires",
  forte: ["Data Analysis", "Statistical Modeling"],
  langs: ["R", "Python", "SQL"]
});

db.Student.aggregate(
  [
    {
      $group: {
        _id: "$branch",
        branchwiseStrength : {
          $sum : 1
        }
    }}
  ])

db.Student.aggregate([
  { $unwind: "$langs" },
  {
    $group: {
      _id: "$langs",
      Strength: { sum: 1 }
    }
  }
]);

db.Student.aggregate([
  {
    $group:
    {
      _id : "$division"
    }
  }
])