db.orders.find({
    'is_paid': {'$exists': false}
});

   