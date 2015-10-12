ratings = [
    {
        evaluation_id: 1,
        rating_value: 'red',
        student_id: 1
    },
    {
        evaluation_id: 1,
        rating_value: 'green',
        student_id: 2
    },
    {
        evaluation_id: 1,
        rating_value: 'green',
        student_id: 3
    },
    {
        evaluation_id: 1,
        rating_value: 'yellow',
        student_id: 4
    },
    {
        evaluation_id: 1,
        rating_value: 'green',
        student_id: 5
    },
    #evals 2
    {
        evaluation_id: 2,
        rating_value: '5',
        student_id: 1
    },
    {
        evaluation_id: 2,
        rating_value: '5',
        student_id: 2
    },
    {
        evaluation_id: 2,
        rating_value: '2',
        student_id: 3
    },
    {
        evaluation_id: 2,
        rating_value: '3',
        student_id: 4
    },
    {
        evaluation_id: 2,
        rating_value: '4',
        student_id: 5
    },
    #evals 3
    {
        evaluation_id: 3,
        rating_value: '11',
        student_id: 1
    },
    {
        evaluation_id: 3,
        rating_value: '99',
        student_id: 2
    },
    {
        evaluation_id: 3,
        rating_value: '76',
        student_id: 3
    },
    {
        evaluation_id: 3,
        rating_value: '88',
        student_id: 4
    },
    {
        evaluation_id: 1,
        rating_value: '81',
        student_id: 5
    }
]

Rating.delete_all
Rating.create!(ratings)