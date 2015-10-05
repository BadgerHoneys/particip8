rating_types = [
    {
        name: 'Stop Light',
        scale: '3'
    },
    {
        name: '5 Stars',
        scale: '5'
    },
    {
        name: '100 Percent',
        scale: '100'
    },
]

RatingType.delete_all
RatingType.create!(rating_types)