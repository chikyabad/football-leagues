
/**
 * Custom hanlder for league-service
 */

module.exports = (srv) => {

    srv.before('CREATE', 'players', req => {
        console.log('Executing custom handler for Create/Update on Players')
        if ((req.data.number > 25) || (req.data.number < 1)) {
            req.error (400,'Number must be greater than 0 and lower than 25')
        }
    })

}
