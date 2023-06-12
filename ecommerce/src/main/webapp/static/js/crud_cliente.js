class LinhaEndereco {
    constructor(dados_endereco, radioRequired = "") {
        this.id = dados_endereco.id;
        this.frase = dados_endereco.frase;
        this.residencia = dados_endereco.residencia;
        this.cep = dados_endereco.cep;
        this.tipo_logradouro = dados_endereco.tipo_logradouro;
        this.logradouro = dados_endereco.logradouro;
        this.numero = dados_endereco.numero;
        this.bairro = dados_endereco.bairro
        this.cidade = dados_endereco.cidade.nome_cidade;
        this.estado = dados_endereco.cidade.estado.nome_estado;
        this.pais = dados_endereco.cidade.estado.pais.nome_pais;
        this.observacao = dados_endereco.observacao;
        this.tipo = dados_endereco.tipo;
        this.cliente_id = dados_endereco.cliente_id;
        this.radioRequired = radioRequired;
    }

    criaLinhaEndereco() {
        return `<div style="display: flex; flex-direction: row; align-items: center; justify-content: flex-start;">
                    <a class="accordion-toggle" data-toggle="collapse" href="#endereco_${this.id}">
                        <h4><span class="text"><strong>${this.frase}</strong></span></h4>
                    </a>
                    <input style="height: 15px; margin-left: 25px" type="radio" id="endereco_selecionado_${this.id}" name="endereco_selecionado_id" value="${this.id}" ${this.radioRequired} onclick="calculaValorTotalFinal()">
                </div>
        <div id="endereco_${this.id}" class="accordion-body collapse js-liberar-edicao">
        <form id="formAlterarEndereco_${this.id}" action="AlterarEndereco" method="POST">
            <input value="${this.tipo}" type="hidden" name="endereco_tipo">
            <input value="${this.cliente_id}" type="hidden" name="endereco_${this.tipo.toLowerCase()}_cliente_id">
            <input value="${this.id}" type="hidden" name="endereco_${this.tipo.toLowerCase()}_id">
            <div class="accordion-inner">
                <div class="row-fluid">
                    <div class="span5 col">
                        <fieldset>
                            <div class="control-group">
                                <label class="control-label">Frase curta para nomear endereço*:</label>
                                <div class="controls">
                                    <input value="${this.frase}" type="text" readonly class="form-control-plaintext" name="endereco_${this.tipo.toLowerCase()}_frase_cliente">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Tipo de residência*:</label>
                                <select value="${this.residencia}" readonly class="form-control-plaintext" name="endereco_${this.tipo.toLowerCase()}_tipo_residencia_cliente">
                                    <option value="casa">Casa</option>
                                    <option value="apartamento">Apartamento</option>
                                    <option value="outro">Outro</option>
                                </select>
                            </div>
                            <div class="control-group">
                                <label class="control-label">CEP*:</label>
                                <div class="controls">
                                    <input value="${this.cep}" type="text" readonly class="form-control-plaintext" name="endereco_${this.tipo.toLowerCase()}_cep_cliente">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Tipo de logradouro*:</label>
                                <select value="${this.tipo_logradouro}" readonly class="form-control-plaintext" name="endereco_${this.tipo.toLowerCase()}_tipo_logradouro_cliente">
                                    <option value="rua">Rua</option>
                                    <option value="avenida">Avenida</option>
                                    <option value="travessa">Travessa</option>
                                    <option value="viela">Viela</option>
                                    <option value="rodovia">Rodovia</option>
                                    <option value="outro">Outro</option>
                                </select>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Logradouro*:</label>
                                <div class="controls">
                                    <input value="${this.logradouro}" type="text" readonly class="form-control-plaintext" name="endereco_${this.tipo.toLowerCase()}_logradouro_cliente">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Número*:</label>
                                <div class="controls">
                                    <input value="${this.numero}" type="text" readonly class="form-control-plaintext" name="endereco_${this.tipo.toLowerCase()}_numero_cliente">
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="span1 col"></div>
                    <div class="span5 col">
                        <fieldset>
                            <div class="control-group">
                                <label class="control-label">Bairro*:</label>
                                <div class="controls">
                                    <input value="${this.bairro}" type="text" readonly class="form-control-plaintext" name="endereco_${this.tipo.toLowerCase()}_bairro_cliente">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Cidade*:</label>
                                <div class="controls">
                                    <input value="${this.cidade}" type="text" readonly class="form-control-plaintext" name="endereco_${this.tipo.toLowerCase()}_cidade_cliente">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Estado*:</label>
                                <div class="controls">
                                    <input value="${this.estado}" type="text" readonly class="form-control-plaintext" name="endereco_${this.tipo.toLowerCase()}_estado_cliente">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">País*:</label>
                                <div class="controls">
                                    <input value="${this.pais}" type="text" readonly class="form-control-plaintext" name="endereco_${this.tipo.toLowerCase()}_pais_cliente">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Observação:</label>
                                <div class="controls">
                                    <textarea readonly class="form-control-plaintext" name="endereco_${this.tipo.toLowerCase()}_observacao_cliente">${this.observacao}</textarea>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <button class="btn btn-warning btn-sm rounded-0" type="button" data-toggle="tooltip" data-placement="center" title="Editar" onclick="liberarEdicaoAccordion(this)">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                            <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
                        </svg>
                    </button>
                </div>
                <div class="actions span3" style="float: right"><input tabindex="9" form="formAlterarEndereco_${this.id}" class="btn btn-inverse large hidden" type="submit" name="operacao" value="ALTERAR"></div>
            </div>
        </form>
    </div>
    <hr>`
    }
}

class LinhaPedido {
    constructor(dados_pedido, radioRequired = "", isClienteView) {
        this.id = dados_pedido.id;
        this.item_pedido = dados_pedido.item_pedido;
        this.valor_total = dados_pedido.valor_total;
        this.data_pedido = dados_pedido.data_pedido;
        this.situacao = dados_pedido.situacao;
        this.codigo_pedido = dados_pedido.codigo;
        this.codigo_cliente = dados_pedido.cliente_id;
        this.ultima_atualizacao = dados_pedido.ultima_atualizacao;
        this.pedido_troca = dados_pedido.pedido_troca || [];
        this.isClienteView = isClienteView;
    }

    criaLinhaPedido() {
            return `
                <tr>
                    <td>
                        <a>
                            <span class="text"><strong>${this.id}</strong> - ${this.codigo_pedido}</span>
                        </a>
                        <div id="pedido_${this.id}" class="accordion-body collapse pedido_${this.id}">
                            <div class="accordion-inner">
                                <div class="row-fluid">
                                    <h4 class="title"><strong>Resumo</strong> da compra</h4>
                                    <table class="table table-striped table-hover" style="background-color: transparent;">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>Produto</th>
                                                <th>Quantidade</th>
                                                <th>Preço Unitário</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            ${this.item_pedido.map((item, index) => {
                                                if(index == this.item_pedido.length - 1){
                                                    return this.criaItemsPedido(item) + `<tr>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                        <td><strong>R$${this.valor_total.toFixed(2).replace('.', ',')}</strong></td>
                                                        </tr>
                                                        `;
                                                } else return this.criaItemsPedido(item);
                                            })}
                                        </tbody>
                                    </table>                                    
                                    ${this.verificaPedidosTroca()}
                                </div>
                            </div>
                        </div>
                    </td>
                    <td><a href="ConsultarCliente?operacao=CONSULTAR&cli_id=${this.codigo_cliente}" target="_blank">${this.codigo_cliente}</a></td>
                    <td>${this.data_pedido}</td>
                    <td>R$${this.valor_total.toFixed(2).replace('.', ',')}</td>
                    <td>${this.ultima_atualizacao}</td>
                    <td>
                        <select id="situacao_${this.id}" name="situacao_pedido" value="${this.situacao}" onchange="alteraFormSituacaoPedido(this)" disabled>
                            <option value="EM PROCESSAMENTO">EM PROCESSAMENTO</option>
                            <option value="EM TRANSITO">EM TRÂNSITO</option>
                            <option value="ENTREGUE">ENTREGUE</option>
                            <option value="EM TROCA">EM TROCA</option>
                            <option value="TROCA AUTORIZADA">TROCA AUTORIZADA</option>
                            <option value="APROVADO">APROVADO</option>
                            <option value="REPROVADO">REPROVADO</option>
                            <option value="TROCADO">TROCADO</option>
                        </select>
                        <div class="accordion-body collapse pedido_${this.id}" style="display: flex; flex-direction: row; justify-content: center; align-items: center;">
                            <div class="accordion-inner">
                                <div class="row-fluid">
                                    <div class="actions span3" style="margin: auto"><input class="btn btn-inverse large hidden" type="submit" name="operacao" value="ALTERAR" form="formAlterarSituacaoPedido"></div>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td>
                        <button class="btn btn-warning btn-sm rounded-0" type="button" data-toggle="collapse" data-target=".pedido_${this.id}" href="#pedido_${this.id}" title="Editar" onclick="liberarEdicaoStatusPedido(this)">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
                            </svg>
                        </button>
                    </td>
                </tr>
            </form>`;
    }

    criaItemsPedido(item) {
        if(!item.nome) item.nome = this.item_pedido.find(value => value.id == item.item_pedido_id).nome;
        return `
        <tr>
            <td class="hidden"><input type="checkbox" onchange="handlerCheckItem(this)"></td>
            <td>
                <a href="ConsultarProduto?operacao=CONSULTAR&pro_id=${item.produto_id}" target="_blank"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
            </td>
            <td>${item.nome}</td>
            <td><input type="text" value="${item.quantidade}" class="input-mini" readonly></td>
            <td>R$${item.preco_unitario.toFixed(2).replace('.', ',')}</td>
            <td>R$${(item.preco_unitario * item.quantidade).toFixed(2).replace('.',',')}</td>
        </tr>
        `;
    }

    criaTableItensTroca(pedido){
        return `<table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th></th>
                            <th>Produto</th>
                            <th>Quantidade</th>
                            <th>Preço Unitário</th>
                            <th>Total</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        ${pedido.item_troca.map((item, index) => {
                            if(index == pedido.item_troca.length - 1){
                                return this.criaItemsPedido(item) + `<tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td><strong>R$${pedido.valor_total.toFixed(2).replace('.', ',')}</strong></td>
                                    </tr>
                                    `;
                            } else return this.criaItemsPedido(item);
                        })}
                    </tbody>          
                </table>`
    }

    criaPedidosTroca(pedido) {
        return `<tr data-toggle="collapse" data-target="#pedido_troca_${pedido.id}" class="clickable">
                <td><a type="button" data-toggle="collapse" data-target=".pedido_troca_${pedido.id}" href="#pedido_troca_${pedido.id}">${pedido.id}</a></td>
                <td>${pedido.data_pedido}</td>
                <td>${pedido.situacao}</td>
                <td>R$${pedido.valor_total.toFixed(2).replace('.', ',')}</td>
                ${!pedido.situacao.includes("EM TROCA")? "": `<td>
                <button class="btn btn-success btn-sm rounded-0" type="submit" title="Aprovar Troca" onclick='submitFormAtualizarTroca(${JSON.stringify(pedido)}, true)'>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check" viewBox="0 0 16 16">
                        <path d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z"/>
                    </svg>
                </button>
            </td>
            <td>
                <button class="btn btn-danger btn-sm rounded-0" type="submit" title="Rejeitar Troca" onclick='submitFormAtualizarTroca(${JSON.stringify(pedido)}, false)'>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
                        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                    </svg>
                </button>
            </td>`}
                
            </tr>
            <tr>
                <td colspan="3">
                    <div id="pedido_troca_${pedido.id}" class="collapse">
                        ${this.criaTableItensTroca(pedido)}
                    </div>
                </td>
            </tr>  
        `;
    }

    verificaPedidosTroca() {
        if(!this.pedido_troca) return "";
        return `<h4 class="title"><strong>Pedidos</strong> de troca</h4>
                <table class="table table-striped table-hover" style="background-color: transparent;">
                    <thead>
                        <tr>
                            <th>Solicitação</th>
                            <th>Data Solicitação</th>
                            <th>Situação</th>
                            <th>Valor Total</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        ${this.pedido_troca.map((pedido, index) => {
                            return this.criaPedidosTroca(pedido);
                        })}
                    </tbody>
                </table>
        `
    }
}

class LinhaCupom {
    constructor(dados_cupom, radioRequired = "") {
        this.id = dados_cupom.id;
        this.tipo = dados_cupom.tipo;
        this.valido = dados_cupom.valido;
        this.valor = dados_cupom.valor;
        this.codigo = dados_cupom.codigo;
    }

    criaLinhaCupom() {
            return `
                <tr>
                    <td>${this.codigo}</td>
                    <td>R$${this.valor.toFixed(2).replace('.', ',')}</td>
                    <td>${this.tipo}</td>
                    <td>${this.valido == 0 ? "Já utilizado" : "Válido"}</td>
                </tr>
            `
    }
}