<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>

                <!--CHECKOUT DADOS-->
                <section>
                    <h4>Revise suas informações e seu pedido</h4>
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
                            <h4 class="title"><span class="text">Dados e endereço de entrega</span></h4>
                        </a>
                    </div>
                    <div id="collapseTwo" class="accordion-body collapse">
                        <div class="accordion-inner">
                            <div class="row-fluid">
                                <div class="span6">
                                    <h4>Resumo dos dados</h4>
                                    <div class="control-group">
                                        <label class="control-label">Nome completo</label>
                                        <div class="controls">
                                            <input type="text" placeholder="" class="input-xlarge" readonly value="${usuario_logado.nome}">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Email</label>
                                        <div class="controls">
                                            <input type="text" placeholder="" class="input-xlarge" readonly value="${usuario_logado.email}">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Telefone</label>
                                        <div class="controls">
                                            <input type="text" placeholder="" class="input-xlarge" readonly value="${usuario_logado.telefone}">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Data de nascimento</label>
                                        <div class="controls">
                                            <input type="text" placeholder="" class="input-xlarge" readonly value="${usuario_logado.dta_nascimento}">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">CPF</label>
                                        <div class="controls">
                                            <input type="text" placeholder="" class="input-xlarge" readonly value="${usuario_logado.cpf}">
                                        </div>
                                    </div>
                                </div>
                                <div class="row-fluid">
                                    <div class="span6 col">

                                        <c:import url="./static/webparts/section_dados_checkout_endereco.jsp" var="cEnderecosCliente" charEncoding="UTF-8" />
                                        <c:out value="${cEnderecosCliente}" escapeXml="false" />

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>