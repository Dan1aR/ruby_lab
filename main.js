i = 1
cost = 0
function add() {
    if (document.getElementById('inputName').value == "" || document.getElementById('inputCost').value == "")
        return;

    let cut_tbody = document.getElementById("cur_tbody");

    let new_tr = document.createElement("tr");

    let new_th = document.createElement("th");
    new_th.scope = "row";
    new_th.innerHTML = i;

    let new_td_name = document.createElement("td");
    new_td_name.innerHTML = document.getElementById('inputName').value;

    let new_td_cost = document.createElement("td");
    new_td_cost.innerHTML = document.getElementById('inputCost').value;
    new_td_cost.id = "td_cost";
    cost += parseInt(document.getElementById('inputCost').value, 10);

    new_tr.appendChild(new_th);
    new_tr.appendChild(new_td_name);
    new_tr.appendChild(new_td_cost);
  
    cut_tbody.appendChild(new_tr);
    console.log(document.getElementById('inputName').value)
    i++;

    document.getElementById('inputName').value = "";
    document.getElementById('inputCost').value = "";
}

function show_cost() {
    let cost_output = document.getElementById("cost_output");
    cost_output.value = cost;
}