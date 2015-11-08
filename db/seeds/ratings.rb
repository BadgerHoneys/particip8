ratings = [
    # {
    #     evaluation_id: 1,
    #     rating_value: 'red',
    #     student_id: 1
    # },
    # {
    #     evaluation_id: 1,
    #     rating_value: 'green',
    #     student_id: 2
    # },
    # {
    #     evaluation_id: 1,
    #     rating_value: 'green',
    #     student_id: 3
    # },
    # {
    #     evaluation_id: 1,
    #     rating_value: 'yellow',
    #     student_id: 4
    # },
    # {
    #     evaluation_id: 1,
    #     rating_value: 'green',
    #     student_id: 5
    # },
    #evals 2
    {
        evaluation_id: 2,
        rating_value: '14',
        student_id: 1
    },
    {
        evaluation_id: 2,
        rating_value: '97',
        student_id: 2
    },
    {
        evaluation_id: 2,
        rating_value: '54',
        student_id: 3
    },
    {
        evaluation_id: 2,
        rating_value: '90',
        student_id: 1
    },
    {
        evaluation_id: 2,
        rating_value: '68',
        student_id: 1
    },
    #evals 3
    {
        evaluation_id: 1,
        rating_value: '11',
        student_id: 1
    },
    {
        evaluation_id: 1,
        rating_value: '99',
        student_id: 2
    },
    {
        evaluation_id: 1,
        rating_value: '76',
        student_id: 3
    },
    {
        evaluation_id: 1,
        rating_value: '88',
        student_id: 1
    },
    {
        evaluation_id: 1,
        rating_value: '81',
        student_id: 2
    },
    {
        evaluation_id: 1,
        rating_value: '89',
        student_id: 1
    },
    {
        evaluation_id: 1,
        rating_value: '100',
        student_id: 3
    }
]

Rating.delete_all
Rating.create!(ratings)