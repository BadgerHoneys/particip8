students = [
    {
        first_name: 'Jeffery Thomas',
        email: 'j@thomas.com',
        school_id: 1
    },
    {
        first_name: 'Ron Sick',
        email: 'r@sick.com',
        school_id: 1
    },
    {
        first_name: 'Gary Proud',
        email: 'g@proud.com',
        school_id: 1
    },
    {
        first_name: 'Bob Mitchell',
        email: 'b@mitchell.com',
        school_id: 1
    },
    {
        first_name: 'Tim Smith',
        email: 't@smith.com',
        school_id: 1
    },
]

User.delete_all
User.create!(students)