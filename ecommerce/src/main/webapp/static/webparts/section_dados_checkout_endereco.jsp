<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>

                <!--ENDERECOS-->
                <section id="enderecos_entrega">
                    <h4 class="title"><span class="text"><strong>Endereços</strong> Entrega</span></h4>
                    <h6 class="title"><span class="text"><strong>Selecione um endereço</strong></h6>
                    <div class="js-container-enderecos-entrega"></div>
                </section>
                <section class="cadastrar_novo_endereco_entrega">
                    <button>
                        <a class="accordion-toggle" data-toggle="collapse" href="#cadastrar_novo_endereco_entrega">
                            <h4><span class="text"><strong>Cadastrar</strong> novo endereço</span></h4>
                        </a>
                        </button>
                        <div id="cadastrar_novo_endereco_entrega" class="accordion-body collapse js-liberar-edicao">
                            <form id="formCadastrarNovoEnderecoEntrega" action="CadastrarEnderecoCheckout" method="POST">
                                <input type="hidden" name="endereco_tipo" value="ENTREGA">
                                <input type="hidden" name="endereco_entrega_cliente_id" value="${usuario_logado.id}">
                                <div class="accordion-inner">
                                    <div class="row-fluid">
                                        <div class="span5 col">
                                            <fieldset>
                                                <div class="control-group">
                                                    <label class="control-label">Frase curta para nomear endereço*:</label>
                                                    <div class="controls">
                                                        <input type="text" class="form-control-plaintext" name="endereco_entrega_frase_cliente">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Tipo de residência*:</label>
                                                    <select class="form-control-plaintext" name="endereco_entrega_tipo_residencia_cliente">
                                                        <option value="casa">Casa</option>
                                                        <option value="apartamento">Apartamento</option>
                                                        <option value="outro">Outro</option>
                                                    </select>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">CEP*:</label>
                                                    <div class="controls">
                                                        <input type="text" class="form-control-plaintext" name="endereco_entrega_cep_cliente">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Tipo de logradouro*:</label>
                                                    <select class="form-control-plaintext" name="endereco_entrega_tipo_logradouro_cliente">
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
                                                        <input type="text" class="form-control-plaintext" name="endereco_entrega_logradouro_cliente">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Número*:</label>
                                                    <div class="controls">
                                                        <input type="text" class="form-control-plaintext" name="endereco_entrega_numero_cliente">
                                                    </div>
                                                </div>
                                            </fieldset>
                                            <h6><strong>Lembre-se de SALVAR este endereço para poder utilizá-lo!</strong></h6>
                                        </div>
                                        <div class="span1 col"></div>
                                        <div class="span5 col">
                                            <fieldset>
                                                <div class="control-group">
                                                    <label class="control-label">Bairro*:</label>
                                                    <div class="controls">
                                                        <input type="text" class="form-control-plaintext" name="endereco_entrega_bairro_cliente">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Cidade*:</label>
                                                    <div class="controls">
                                                        <input type="text" class="form-control-plaintext" name="endereco_entrega_cidade_cliente">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Estado*:</label>
                                                    <div class="controls">
                                                        <input type="text" class="form-control-plaintext" name="endereco_entrega_estado_cliente">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">País*:</label>
                                                    <div class="controls">
                                                        <input type="text" class="form-control-plaintext" name="endereco_entrega_pais_cliente">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Observação:</label>
                                                    <div class="controls">
                                                        <textarea class="form-control-plaintext" name="endereco_entrega_observacao_cliente"></textarea>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <div class="actions span3" style="float: right"><input tabindex="9" form="formCadastrarNovoEnderecoEntrega" class="btn btn-inverse large" type="submit" name="operacao" value="SALVAR"></div>
                                </div>
                            </form>
                        </div>
                </section>