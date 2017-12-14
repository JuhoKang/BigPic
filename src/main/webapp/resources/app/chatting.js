/* global
  $:true
  socket:true*/

const name = $('#namebox').val();
let type = 'all';
let id;
let uid = $('#uid').val();

function sendMessage(username, usermsg) {
    if(type == 'all'){
        socket.emit('fromclient', {
            username: username,
            msg: usermsg.val(),
            id: null,
        });
    }else if(type == 'friend'){
        socket.emit('fromclient', {
            username: username,
            msg: usermsg.val(),
            id: id,
        });
        $.ajax({
            type: 'post',
            data: {'data':usermsg.val()},
            url: '/messageController/'+id,
        });
    }else{
        socket.emit('fromclient', {
            username: username,
            msg: usermsg.val(),
            id: id,
        });
        $.ajax({
            type: 'post',
            data: {'data':usermsg.val()},
            url: '/messageController/group/'+id,
        });
    }
    usermsg.val('');
    return false;
}

function receiveMessage(data) {
    if(type == 'all'){
        if(data.id == null){
            $('#msgs').append(`<li class="chattinglist"><span class="chattingbox">${data.from.name} : ${data.msg} </span></li>`);
        }
    }else if(type == 'friend'){
        if(data.id == uid){
            $('#msgs').append(`<li class="chattinglist"><span class="chattingbox">${data.from.name} : ${data.msg} </span></li>`);
        }
    }else{
        if(data.id == id){
            $('#msgs').append(`<li class="chattinglist"><span class="chattingbox">${data.from.name} : ${data.msg} </span></li>`);
        }
    }
    $('#msgcontainer').animate({
        scrollTop: $('.footer').offset().top,
    }, 0);
}

// send Message
$('#msgbox').keyup((event) => {
    if (event.keyCode == 13) {
        const usermsg = $('#msgbox');
        const mymsg = $('#msgbox').val();
        sendMessage(name, usermsg);
        $('#msgs').append(`<li class="my-chattinglist"><span class="chattingbox">${mymsg}</span></li>`);
        $('#msgcontainer').animate({
            scrollTop: $('.footer').offset().top,
        }, 0);
    }
});
$('#msgenter').click((event) => {
    const usermsg = $('#msgbox');
    const mymsg = $('#msgbox').val();
    sendMessage(name, usermsg);
    $('#msgs').append(`<li class="my-chattinglist"><span class="chattingbox">${mymsg}</span></li>`);
    $('#msgcontainer').animate({
        scrollTop: $('.footer').offset().top,
    }, 0);
})

// receiveMessage
socket.on('toclient', function (data) {
    receiveMessage(data);
});

socket.on('login', function (data) {
    $('#msgsname').append(`${data} <br>`);
    $('#msgs').append("join" + '<BR>');
});

$('.friend-chatting').click(function (event) {
    type = 'friend';
    id = $(this).attr('data-friend-id');
    $('#msgs').empty();
    $.ajax({
        type: 'get',
        url: '/messageController/'+id,
        success: function( data ) {
            data.msg.forEach(function(msg){
                if(msg.from._id == id){
                    $('#msgs').append(`<li class="chattinglist"><span class="chattingbox">${msg.from.username} : ${msg.data} </span></li>`);
                }else{
                    $('#msgs').append(`<li class="my-chattinglist"><span class="chattingbox">${msg.data}</span></li>`)
                }
            })
            $('#msgcontainer').animate({
                scrollTop: $('.footer').offset().top,
            }, 0);
        },
        error: function(err){
            console.log(err);
        }
    });
    $(this).closest(".dropdown-menu").prev().dropdown("toggle");
    return false;
});

$('.group-chatting').click(function (event) {
    type = 'group';
    id = $(this).attr('data-group-id');
    $('#msgs').empty();
    $.ajax({
        type: 'get',
        url: '/messageController/group/'+id,
        success: function( data ) {
            data.msg.forEach(function(msg){
                if(msg.from._id == uid){
                    $('#msgs').append(`<li class="my-chattinglist"><span class="chattingbox">${msg.data}</span></li>`)
                }else{
                    $('#msgs').append(`<li class="chattinglist"><span class="chattingbox">${msg.from.username} : ${msg.data} </span></li>`);
                }
            })
            $('#msgcontainer').animate({
                scrollTop: $('.footer').offset().top,
            }, 0);
        },
        error: function(err){
            console.log(err);
        }
    });
    $(this).closest(".dropdown-menu").prev().dropdown("toggle");
    return false;
})

$('.all-chatting').click(function (event) {
    type = 'all';
    $('#msgs').empty();
})