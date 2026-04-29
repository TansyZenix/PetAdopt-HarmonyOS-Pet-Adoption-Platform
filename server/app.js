var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var myuserRouter = require('./routes/myuser');
var mypetRouter = require('./routes/my_pet');
var petRoutes = require('./routes/petRoutes');
var deliver2 = require('./routes/deliver2');
var mycommunity = require('./routes/community');
var myBannedListsRouter = require('./routes/mylist');
var shopRouter = require('./routes/shop');
var hospitalRouter = require('./routes/hospital');

var app = express();

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/myuser', myuserRouter);
app.use('/mypet', mypetRouter);
app.use('/petRoutes', petRoutes);
app.use('/deliver2', deliver2);
app.use('/loginAndRegister', myuserRouter);
app.use('/community', mycommunity);
app.use('/banned_lists', myBannedListsRouter);
app.use('/shop', shopRouter);
app.use('/hospital', hospitalRouter);

module.exports = app;
