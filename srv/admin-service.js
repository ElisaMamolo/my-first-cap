const cds = require('@sap/cds')
module.exports = async function (){

  const db = await cds.connect.to('db') // connect to database service
  const { Albums } = db.entities         // get reflected definitions

  // Reduce stock of ordered albums if available stock suffices
  this.on ('submitOrder', async req => {
    const {album,quantity} = req.data
    const n = await UPDATE (Album, book)
      .with ({ stock: {'-=': quantity }})
      .where ({ stock: {'>=': quantity }})
    n > 0 || req.error (409,`${quantity} exceeds stock for album #${album}`)
  })

}