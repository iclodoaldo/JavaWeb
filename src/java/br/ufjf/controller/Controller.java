/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufjf.controller;

import br.ufjf.dao.UsuarioDAO;
import br.ufjf.model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author clodoaldo
 */
public class Controller extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        EntityManagerFactory emf
                = Persistence.createEntityManagerFactory("LaboratorioPU");

        if (action == null) {
            RequestDispatcher rd = request.getRequestDispatcher("template.jsp?page=home");
            rd.forward(request, response);
        } else if (action.equals("login")) {
            RequestDispatcher rd
                    = request.getRequestDispatcher("template.jsp?page=login");
            rd.forward(request, response);
        } else if (action.equals("logar")) {
            String login = request.getParameter("cpLogin");
            String senha = request.getParameter("cpSenha");

            Usuario u = new UsuarioDAO().getUsuarioByLoginAndPassword(login, senha);
            if (u == null) {
                RequestDispatcher rd
                        = request.getRequestDispatcher("template.jsp?page=login");
                request.setAttribute("msg","Login ou Senha Incorreta!!!");
                rd.forward(request, response);
            }else{
                request.getSession().setAttribute("usuario", u);
                RequestDispatcher rd
                    = request.getRequestDispatcher("template.jsp?page=administracao");
            rd.forward(request, response);
            }
            }else if (action.equals("administracao")) {
            RequestDispatcher rd
                    = request.getRequestDispatcher("template.jsp?page=administracao");
            rd.forward(request, response);
        } else if (action.equals("contato")) {
            RequestDispatcher rd
                    = request.getRequestDispatcher("template.jsp?page=contato");
            rd.forward(request, response);
        } else if (action.equals("servicos")) {
            RequestDispatcher rd
                    = request.getRequestDispatcher("template.jsp?page=servicos");
            rd.forward(request, response);
        } else if (action.equals("portfolio")) {
            RequestDispatcher rd
                    = request.getRequestDispatcher("template.jsp?page=portfolio");
            rd.forward(request, response);
        } else if (action.equals("resultados")) {
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");
            RequestDispatcher rd
                    = request.getRequestDispatcher("template.jsp?page=resultados");
            rd.forward(request, response);
        } 
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
