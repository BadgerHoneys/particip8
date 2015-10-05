students = [
    {
        name: 'Jeffery Thomas',
        email: 'j@thomas.com',
        school_id: 1
    },
    {
        name: 'Ron Sick',
        email: 'r@sick.com',
        school_id: 1
    },
    {
        name: 'Gary Proud',
        email: 'g@proud.com',
        school_id: 1
    },
    {
        name: 'Bob Mitchell',
        email: 'b@mitchell.com',
        school_id: 1
    },
    {
        name: 'Tim Smith',
        email: 't@smith.com',
        school_id: 1
    },
]

Student.delete_all
Student.create!(students)