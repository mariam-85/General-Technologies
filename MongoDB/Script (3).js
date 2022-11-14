db.videos.updateMany(
    {},
    {
        '$mul': { 
            'price': .9
            },
            '$set': {
                'is_approved': true
            },
            '$unset': {
                'is_banned': null
                }
    }
    
)