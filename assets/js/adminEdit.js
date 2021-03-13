/**
 * User Settings
 */
var username = document.getElementById('username');
var email = document.getElementById('email');
var first_name = document.getElementById('first_name');
var last_name = document.getElementById('last_name');
var save_user = document.getElementById('user_save');

/**
 * Contact Settings
 */
var address = document.getElementById('address');
var city = document.getElementById('city');
var country = document.getElementById('country');
var contact_save = document.getElementById('contact_save');

var userID = GET['id'];

$.getJSON("assets/php/getCountries.php", function (data) {
    for (var i = 0; i < data.length; i++) {
        var opt = document.createElement('option');
        opt.value = data[i].id;
        opt.innerHTML = data[i].nicename;
        country.appendChild(opt);
    }
}).done(function () {
    console.log("second success");
}).fail(function () {
    console.log("getting json failed");
    alert("JSON Error: could not load country data");
}).always(function () {
    console.log("complete");
})

$.getJSON("assets/php/getUsers.php?id=" + userID, function (data) {
    console.log(data);
    username.value = data[0].Username;
    email.value = data[0].Email;
    first_name.value = data[0].Vorname;
    last_name.value = data[0].Nachname;
    address.value = data[0].Addresse;
    city.value = data[0].Stadt;
    country.selectedIndex = +data[0].Land - 1; //DB IDs start at 1 index starts at 0 thats why
}).done(function () {
    console.log("second success");
}).fail(function () {
    console.log("getting json failed");
    alert("JSON Error: could not load user data");
}).always(function () {
    console.log("complete");
})

save_user.onclick = function () {
    const data = {
        username: username.value,
        email: email.value,
        first_name: first_name.value,
        last_name: last_name.value,
        id: userID
    }
    $.post('assets/php/setUserSettingsA.php', data, function (data, status) {
        console.log(`${data} and status is ${status}`);
        document.getElementById('success-dlg').style.display = '';
        setTimeout(function () {
            $('#success-dlg').fadeOut('slow');
        }, 1000);
    });
    //location.reload();
}

contact_save.onclick = function () {
    const data = {
        address: address.value,
        city: city.value,
        country: country.value,
        id: userID
    }
    $.post('assets/php/setUserSettingsA.php', data, function (data, status) {
        console.log(`${data} and status is ${status}`);
        document.getElementById('success-dlg').style.display = '';
        setTimeout(function () {
            $('#success-dlg').fadeOut('slow');
        }, 1000);
    });
}