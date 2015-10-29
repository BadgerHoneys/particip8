evaluation_templates = [
    {
        name: 'Math Participation',
        school_class_id: 1,
        rating_type_id: 1
    },
    {
        name: 'Science Participation',
        school_class_id: 1,
        rating_type_id: 2
    },
    {
        name: 'English Participation',
        school_class_id: 2,
        rating_type_id: 1
    },
    {
        name: 'History Participation',
        school_class_id: 3,
        rating_type_id: 1
    },
    {
        name: 'Class Participation',
        school_class_id: 3,
        rating_type_id: 2
    },
    {
        name: 'Math Participation',
        school_class_id: 2,
        rating_type_id: 1
    }
]

EvaluationTemplate.delete_all
EvaluationTemplate.create!(evaluation_templates)