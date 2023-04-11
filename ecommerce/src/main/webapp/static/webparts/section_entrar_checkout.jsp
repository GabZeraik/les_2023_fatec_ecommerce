<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>

                <!--CHECKOUT ENTRAR-->
                <div class="accordion" id="accordion2">
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                                <h4>Entrar</h4>
                            </a>
                        </div>
                        <div id="collapseOne" class="accordion-body in collapse">
                            <div class="accordion-inner">
                                <div class="span6">
                                    <p>Entre com seu cadastro para finalizar a compra</p>
                                    <form action="#" method="post">
                                        <fieldset>
                                            <div class="control-group">
                                                <label class="control-label">Usuário</label>
                                                <div class="controls">
                                                    <input type="text" placeholder="Digite seu usuário" id="username" class="input-xlarge">
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">Senha</label>
                                                <div class="controls">
                                                    <input type="password" placeholder="Digite sua senha" id="password" class="input-xlarge">
                                                </div>
                                            </div>
                                            <button class="btn btn-inverse">Entrar</button>
                                        </fieldset>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>