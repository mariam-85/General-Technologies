db.eventlog.find( 
    {
        'weight_kg': {
         '$gte': 5,
         '$lte': 8
        },
      
        'type': 'washing'
    }
)
