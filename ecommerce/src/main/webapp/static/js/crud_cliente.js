class LinhaEndereco {
    constructor(dados_endereco) {
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
    }

    criaLinhaEndereco() {
        return `<a class="accordion-toggle" data-toggle="collapse" href="#endereco_${this.id}">
                    <h4><span class="text"><strong>${this.frase}</strong></span></h4>
                </a>
        <div id="endereco_${this.id}" class="accordion-body collapse js-liberar-edicao">
        <form id="formAlterarEndereco_${this.id}" action="AlterarEndereco" method="POST">
            <input value="${this.tipo}" type="hidden" name="endereco_${this.tipo.toLowerCase()}_tipo">
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