evaluation_types = [
    {
        name: 'Class Participation'
    },
    {
        name: 'In Class Activity'
    },
    {
        name: 'Homework'
    }
]
EvaluationType.delete_all
EvaluationType.create!(evaluation_types)