school_classes = [
    {
        school_id: 1,
        teacher_id: 1,
        name: 'Math',
        start_time: Time.now,
        end_time: Time.now + 1.hour
    },
    {
        school_id: 1,
        teacher_id: 2,
        name: 'Science',
        start_time: Time.now,
        end_time: Time.now + 1.hour
    },
    {
        school_id: 1,
        teacher_id: 3,
        name: 'Physics',
        start_time: Time.now + 1.hour,
        end_time: Time.now + 2.hour
    },
    {
        school_id: 2,
        teacher_id: 4,
        name: 'History',
        start_time: Time.now + 1.hour,
        end_time: Time.now + 2.hour
    },
    {
        school_id: 2,
        teacher_id: 5,
        name: 'Biology',
        start_time: Time.now - 1.hour,
        end_time: Time.now
    },
    {
        school_id: 3,
        teacher_id: 1,
        name: 'Chemistry',
        start_time: Time.now - 1.hour,
        end_time: Time.now
    },
    {
        school_id: 3,
        teacher_id: 1,
        name: 'English',
        start_time: Time.now - 2.hour,
        end_time: Time.now
    },
    {
        school_id: 4,
        teacher_id: 2,
        name: 'Reading',
        start_time: Time.now - 2.hour,
        end_time: Time.now
    },
]

SchoolClass.delete_all
SchoolClass.create!(school_classes)