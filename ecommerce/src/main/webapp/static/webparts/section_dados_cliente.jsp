<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>
                <!--DADOS PESSOAIS-->
                <section class="cadastro_cliente js-liberar-edicao">
                    <form id="formAlterarCadastroParcial" action="AlterarClienteParcial" method="POST">
                        <input type="hidden" id="formAlterarCadastroParcial_id" name="id_cliente" class="input-xlarge">
                        <input type="hidden" name="operacao" value="ALTERAR">
                        <h4 class="title"><span class="text"><strong>Cadastro</strong> Cliente</span></h4>
                        <div class="span12">
                            <div class="span5 col">
                                <fieldset>
                                    <div class="control-group">
                                        <label class="control-label">Usuário*:</label>
                                        <div class="controls">
                                            <input readonly type="text" placeholder="Digite seu usuário" id="formAlterarCadastroParcial_usuario" name="usuario_cliente" class="input-xlarge">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Senha*:</label>
                                        <div class="controls">
                                            <input readonly type="password" placeholder="Digite sua senha" id="formAlterarCadastroParcial_senha" name="senha_cliente" class="input-xlarge">
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                            <div class="span5 col">
                                <fieldset>
                                    <div class="control-group">
                                        <label class="control-label">Nome completo*:</label>
                                        <div class="controls">
                                            <input readonly type="text" placeholder="Digite o nome completo" id="formAlterarCadastroParcial_nome_completo" name="nome_cliente" class="input-xlarge">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Data de nascimento*:</label>
                                        <div class="controls">
                                            <input readonly type="date" id="formAlterarCadastroParcial_data_nascimento" name="data_nascimento_cliente" class="input-xlarge">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Gênero*:</label>
                                        <select readonly class="controls" id="formAlterarCadastroParcial_genero" name="genero_cliente">
                                <option value="feminino">Feminino</option>
                                <option value="masculino">Masculino</option>
                                <option value="outro">Outro</option>
                            </select>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">CPF*:</label>
                                        <div class="controls">
                                            <input readonly type="text" placeholder="Digite seu cpf" id="formAlterarCadastroParcial_cpf" name="cpf_cliente" class="input-xlarge">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Email*:</label>
                                        <div class="controls">
                                            <input readonly type="email" placeholder="Digite seu email" id="formAlterarCadastroParcial_email" name="email_cliente" class="input-xlarge">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Telefone*:</label>
                                        <div class="controls">
                                            <input readonly type="tel" placeholder="XX" id="formAlterarCadastroParcial_telefone_ddd" name="telefone_ddd_cliente" class="input-mini">
                                            <input readonly type="tel" placeholder="XXXXX-XXXX" id="formAlterarCadastroParcial_telefone_numero" name="telefone_numero_cliente" class="input-small">
                                            <select readonly class="controls" id="formAlterarCadastroParcial_telefone_tipo" name="telefone_tipo_cliente">
                                    <option value="residencial">Residencial</option>
                                    <option value="celular">Celular</option>
                                    <option value="comercial">Comercial</option>
                                </select>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                            <button class="btn btn-warning btn-sm rounded-0" type="button" data-toggle="tooltip" data-placement="center" title="Editar" onclick="liberarEdicaoAccordion(this)">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                            <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
                        </svg>
                    </button>
                            <div class="actions span3" style="float: right"><input id="btn_alterar_cadastro" form="formAlterarCadastroParcial" class="btn btn-inverse large hidden" type="submit" value="ALTERAR"></div>
                        </div>
                    </form>
                </section>