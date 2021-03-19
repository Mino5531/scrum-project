/**
 * HTML List
 */
var game_list = document.getElementById('game-list');

/**
 * Admin edit buttons
 */
var game_edit = document.getElementById('game-edit');
var game_save = document.getElementById('game-save');
var game_add = document.getElementById('game-add');

/**
 * Script vars
 */
var edits = {};
var show = [];
var count = 0;

function editGames() {
    game_edit.style.display = 'none';
    game_add.style.display = '';
    game_save.style.display = '';

    show.forEach(element => {
        element.style.display = 'none';
    });

    for (var key in edits) {
        edits[key][0].style.display = '';
        edits[key][1].style.display = '';
        edits[key][2].style.display = '';
    }
}

function saveGames() {
    game_edit.style.display = '';
    game_save.style.display = 'none';
    game_add.style.display = 'none';

    show.forEach(element => {
        element.style.display = '';
    });
    count = 0;
    for (var key in edits) {
        edits[key][0].style.display = 'none';
        edits[key][1].style.display = 'none';
        edits[key][2].style.display = 'none';
        const data = {
            id: key,
            name: edits[key][0].value,
            link: edits[key][1].value,
            mode: 'update'
        }
        $.post('assets/php/gameSelect.php', data, function (data, status) {
            console.log(`${data} and status is ${status}`);
            loadGames(); //This is dirty but at least it works 
        });
    }
    document.getElementById('success-dlg').style.display = '';
    setTimeout(function () {
        $('#success-dlg').fadeOut('slow');
    }, 1000);
}

function addGame() {
    $('#addGameModal').modal('show');
}

function saveNewGame() {
    $('#addGameModal').modal('hide');
    const data = {
        mode: 'create',
        name: document.getElementById('new-game-name').value,
        link: document.getElementById('new-game-url').value
    }
    $.post('assets/php/gameSelect.php', data, function (data, status) {
        console.log(`${data} and status is ${status}`);
        document.getElementById('new-game-name').value = '';
        document.getElementById('new-game-url').value = '';
        saveGames();
        loadGames();
    })
}

function deleteGame(id) {
    const data = {
        mode: 'delete',
        id: id
    }
    $.post('assets/php/gameSelect.php', data, function (data, status) {
        console.log(`${data} and status is ${status}`);
        saveGames();
        loadGames();
    })
}

function loadGames() {
    $.getJSON('assets/php/gameSelect.php', function (data) {
        game_list.innerHTML = '';
        for (let i = 0; i < data.length; i++) {
            var li = document.createElement('li');
            var link = document.createElement('a');
            var text = document.createElement('strong');
            var div = document.createElement('div');
            var edit_text = document.createElement('input');
            var edit_link = document.createElement('input');
            var deleteButton = document.createElement('button');

            edits[data[i].GameID] = [edit_text, edit_link, deleteButton];

            show.push(link);
            show.push(text);

            div.classList.add('row');

            deleteButton.classList.add('btn', 'border-0');
            deleteButton.style.display = 'none';
            deleteButton.innerHTML = '<i class="fas fa-trash"></i>';
            deleteButton.id = data[i].GameID;
            deleteButton.onclick = function () { deleteGame(this.id) };
            deleteButton.style.width = '10%';

            edit_text.value = data[i].Name;
            edit_text.classList.add('form-control');
            edit_text.style.display = 'none';
            edit_text.placeholder - 'Name';
            edit_text.style.width = '40%';
            edit_text.style.marginLeft = '15px';

            edit_link.value = data[i].URL;
            edit_link.classList.add('form-control');
            edit_link.style.display = 'none';
            edit_link.placeholder = 'Link';
            edit_link.style.width = '40%';
            edit_link.style.marginLeft = 'auto';
            edit_link.style.marginRight = '60px';

            link.classList.add('btn', 'float-end', 'rounded-circle', 'border-0');
            link.href = data[i].URL;
            link.innerHTML = '<i class="fa fa-arrow-right"></i>';
            text.classList.add('gametitle');
            text.innerHTML = data[i].Name;
            li.classList.add('list-group-item');
            li.appendChild(link);
            li.appendChild(text);
            div.appendChild(edit_text);
            div.appendChild(edit_link);
            div.appendChild(deleteButton);
            li.appendChild(div);
            game_list.appendChild(li);
        }
    })
}

function readyPage() {
    if ($('#game-edit').length > 0) {
        game_edit.onclick = function () { editGames() };
        game_save.onclick = function () { saveGames() };
        game_add.onclick = function () { addGame() };
    }
    loadGames();
}