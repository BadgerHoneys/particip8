districts = [
    {
        name:'North Attleboro'
    },
    {
        name:'Boston'
    },
    {
        name:'Rochester'
    },
]
District.delete_all
District.create!(districts)
