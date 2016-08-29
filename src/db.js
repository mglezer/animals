var mysql = require('mysql2/promise');
var util = require('util');

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'animals',
    Promise: require('bluebird')
});

var getState = function(user_id) {
    connection
        .then(function(conn) {
            return conn.query('SELECT * FROM state WHERE user_id = ?', [user_id]);
        })
        .then(function(rows) {
            return rows[0][0];
        });
};

var getNodeById = function(node_id) {
    connection.then(function(conn) {
        return conn.query('SELECT * FROM tree WHERE id = ?', [node_id]);
    });
};

exports.getCurrentNode = function(user_id) { 
    getState(user_id).then(function(state) {
        return getNodeById(state.node_id);
    });
};

/*
exports.split = function(node_id, question) {


};
*/

exports.test = function() {
    connection.then(function(conn) {
        return conn.query('SELECT * from animal');
    }).then(function(rows) {
        console.log('DB results: ', rows[0][0]);
    });
}

