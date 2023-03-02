$(document).ready(function () {

    //Insertar en editar


    var caja = $('#InsertarNuevo');

    $("#InsertarNuevo").hide();
    $('#ocultar').hide();

    $("#MostrarInsert").click(function () {
        $(this).hide();
        $('#ocultar').show();
        caja.show('slow');
    });

    $("#ocultar").click(function () {
        $(this).hide();
        $('#MostrarInsert').show()
        caja.hide('slow');
    });

        //$("#InsertarNuevo").hide();

        //$("#MostrarInsert").click(function(){

        //    $("#InsertarNuevo").show();

        //});

     //Insertar en editar


    //Edita los Pedidos
    $("#btnInsertarVenta").click(function () {

        var PedidoId = $("#ped_Id").val();
        var cliente = $("#cli_Id").val();
        var FechaPedido = $("#ped_Fecha").val();
        var Direccion = $("#dire_id").val();
        var Empleado = $("#emp_id").val();
        var metodopagoId = $("#metpago_Id").val();

        $("#ped_Id").prop("disabled", true);
        $("#cli_Id").prop("disabled", true);
        $("#ped_Fecha").prop("disabled", true);
        $("#dire_id").prop("disabled", true);
        $("#emp_id").prop("disabled", true);
        $("#metpago_Id").prop("disabled", true);

        $(".containerOculto").show();
        $(".btnInsertarVenta").fadeOut();

        $.ajax({
            type: "POST",
            url: "/Pedidos/Edit",
            data: { ped_Id: PedidoId, cli_Id: cliente, ped_Fecha: FechaPedido, dire_id: Direccion, emp_id: Empleado, metpago_Id: metodopagoId },
            success: function (response) {



            },
            error: function (error) {

            }
        });
    });
    //Edita los Pedidos

    //inserta pedidos

    $('#btnEditar').click(function () {
        var clic_Id = $("#cli_Id").val();
        var ped_Id = $("#ped_Id").val();
        var articulo = $('#art_Id').val();
        var Precio = $("#pede_precio").val();
        var Stock = $("#pede_Stock").val();
        var text = $('#art_Id').find('option[value=' + articulo + ']').text();

        if (articulo == "" || Precio == "" || Stock == "") {



            if (Stock == "") {
                $("#stockValid").show();
            }

        } else {



            var cadena = "<tr>";
            cadena += "<td> " + text + "</td>";
            cadena += "<td> " + Precio + "</td>";
            cadena += "<td> " + Stock + "</td>";
            cadena += "</tr>";
            //console.log(cadena);


            var SubTotal;
            SubTotal = parseFloat(Stock) * parseFloat(Precio);
            var precio2 = 0;
            precio2 = parseFloat(precio2) + SubTotal;
            var total = precio2;

            console.log("total = " + total);


            $("#txttotal").val(total);


            $("#tabla1").append(cadena);



            $.ajax({
                type: 'POST',
                url: '/Pedidos/CreateDetalles2',
                data: { ped_Id: ped_Id,  art_Id: articulo, pede_Precio: Stock },
                success: function (result) {

                    var total = 0;
                    console.log(result);
                    $.each(result, function (index, item) {

                        var subtotal = parseFloat(item.pede_Cantidad) * parseInt(item.pede_Cantidad);
                        total += subtotal;
                        //cadena += "<tr><td>" + item.art_Id + "</td><td>" + item.pede_Precio + "</td><td>" + item.pede_Cantidad + "</td></tr>";
                        console.log(cadena);

                        

                    });
                    $("#tbodyVentas").html(cadena);
                    
                },
                error: function (error) {

                }

            });


        }
    });

    //Inserta pedidos

    
    //Funciones del modal
    function DeleteModal() {
        $('#confirm-delete-modal').modal({ backdrop: 'static', keyboard: false })
    }
    function cerrar() {
        $("#confirm-delete-modal").modal("hide");
    }
    function hola(id) {
        $('#confirm-delete-modal').modal('show')
        $('#btn-confirm-delete').attr('href', '/PedidosDetalles/Delete/' + id + '00011001001110102100101010011010101' + $("#ped_Id").val());
    }
    //Funciones del modal

    //Carga los articulos de el pedido
    $(document).ready(function () {
        var ped_Id = $("#ped_Id").val();

        console.log(ped_Id);

        $.ajax({
            type: 'POST',
            url: '/Pedidos/CargarPedidoDetalles',
            data: { ped_Id: ped_Id },
            success: function (result) {
                console.log(result);
                var cadena = "";
                $.each(result, function (index, item) {
                    cadena += "<tr><td>" + item.ped_Id + "</td><td>" + item.pede_Cantidad + "</td><td>" + item.pede_UsuarioModificacion + "</td><td>" + item.pede_Precio + "</td><td>" + "<a href = '/PedidosDetalles/Edit/" + item.pede_Id + "' class='btn btn-block btn-warning bi bi-pencil-fill' ></a> " + "</td><td>" + " <button onclick='hola(" + item.pede_Id + ")' id='btn-delete' class='btn-delete btn btn-block btn-danger bi bi-trash-fill' data-id='" + item.pede_Id + "'>" + "" + "</button> " + "</td></tr>";
                    console.log(1781);
                });
                console.log(cadena);
                //$("#tbodyDirecciones").append(cadena);
                $("#tbodyDirecciones").html(cadena);

            },
            error: function (error) {
                console.log(404);
                console.log(error);
            }
        });
    });
    //Carga los articulos de el pedido



    //Retorna los precios de los articulos
    $("#pede_precio").val(0);

    $("#art_Id").change(function () {
        var art_Id = $("#art_Id").val();
        $.ajax({
            url: "/Pedidos/CargarArticulos",
            method: "POST",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({ art_Id: art_Id }),
            success: function (data) {
                console.log(data);
                $("#pede_precio").empty();
                $("#pede_precio").val(data);
            }
        })
    });
    //Retorna los precios de los articulos



    //Traduce el datatable
    $("#tabla1").DataTable({
        language: {
            url: '//cdn.datatables.net/plug-ins/1.13.2/i18n/es-MX.json'
        }
    });
    //Traduce el datatable



});