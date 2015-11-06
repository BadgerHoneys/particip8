ratings = [
    {
        evaluation_id: 1,
        rating_value: 'red',
        user_id: 1
    },
    {
        evaluation_id: 1,
        rating_value: 'green',
        user_id: 2
    },
    {
        evaluation_id: 1,
        rating_value: 'green',
        user_id: 3
    },
    {
        evaluation_id: 1,
        rating_value: 'yellow',
        user_id: 4
    },
    {
        evaluation_id: 1,
        rating_value: 'green',
        user_id: 5
    },
    #evals 2
    {
        evaluation_id: 2,
        rating_value: '5',
        user_id: 1
    },
    {
        evaluation_id: 2,
        rating_value: '5',
        user_id: 2
    },
    {
        evaluation_id: 2,
        rating_value: '2',
        user_id: 3
    },
    {
        evaluation_id: 2,
        rating_value: '3',
        user_id: 4
    },
    {
        evaluation_id: 2,
        rating_value: '4',
        user_id: 5
    },
    #evals 3
    {
        evaluation_id: 3,
        rating_value: '11',
        user_id: 1
    },
    {
        evaluation_id: 3,
        rating_value: '99',
        user_id: 2
    },
    {
        evaluation_id: 3,
        rating_value: '76',
        user_id: 3
    },
    {
        evaluation_id: 3,
        rating_value: '88',
        user_id: 4
    },
    {
        evaluation_id: 1,
        rating_value: '81',
        user_id: 5
    }
]

Rating.delete_all
Rating.create!(ratings)