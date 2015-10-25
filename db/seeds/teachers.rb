teachers = [
    {
        first_name: "Josh", 
        last_name: "Woodward",
        email: "josh@josh.com",
        school_id: 1,
        password: "josh"
    },
    {
        first_name: "Zack", 
        last_name: "Downs",
        email: "zack@zack.com",
        school_id: 1,
        password: "zack"
    },
    {
        first_name: "Paul", 
        last_name: "Darragh",
        email: "paul@paul.com",
        school_id: 1,
        password: "paul"
    },
    {
        first_name: "Gerry",
        last_name: "Thornberg",
        email: "g@thornberg",
        school_id: 1,
        password: "topsecret"
    },
    {
        first_name: "Michelle",
        last_name: "Grant",
        email: 'm@grant.com',
        school_id: 1,
        password: 'topsecret'
    }
]

Teacher.delete_all
Teacher.create!(teachers)