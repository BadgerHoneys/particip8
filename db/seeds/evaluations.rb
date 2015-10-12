evaluations = [
    {
        evaluation_template_id: 1
    },
    {
        evaluation_template_id: 2
    },
    {
        evaluation_template_id: 3
    },
    {
        evaluation_template_id: 4
    },
    {
        evaluation_template_id: 5
    },
    {
        evaluation_template_id: 6
    }
]

Evaluation.delete_all
Evaluation.create!(evaluations)