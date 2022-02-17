//expose a variable or a function
module.exports = srv => {
    const { Albums } = cds.entities('cap.store')

    srv.on('submitOrder', async req => {
        const { album, quantity } = req.data;
        if (quantity < 1) return req.reject(400, `quantity has to be 1 or more`)
        //get stock from album where id album value (its id)
        let b = await SELECT`stock`.from(Albums, album)
        if (!b) return req.error(404, `Album #${album} doesn't exist`)
        let { stock } = b
        if (quantity > stock) return req.reject(409, `${quantity} exceeds stock for album #${album}`)
        await UPDATE(Albums, album).with({ stock: stock -= quantity })
        await this.emit('OrderedAlbum', { album, quantity, buyer: req.user.id })
        return { stock }
    })
}

