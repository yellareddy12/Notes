package com.example.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.model.Note;

/**
 * Servlet implementation class notes
 */
@WebServlet("/notes")
public class notes extends HttpServlet {
       
	 private static final long serialVersionUID = 1L;
	    private List<Note> notes = new ArrayList<>();
	    private int noteIdCounter = 1;

    public notes() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("notes", notes);
        request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String action = request.getParameter("action");
	        if (action != null) {
	            switch (action) {
	                case "add":
	                    addNote(request);
	                    break;
	                case "delete":
	                    deleteNote(request);
	                    break;
	                case "edit":
	                    editNote(request);
	                    break;
	            }
	        }
	        response.sendRedirect("notes");
	    }

	    private void addNote(HttpServletRequest request) {
	        String title = request.getParameter("title");
	        String content = request.getParameter("content");
	        if (title != null && !title.isEmpty() && content != null && !content.isEmpty()) {
	            notes.add(new Note(noteIdCounter++, title, content));
	        }
	    }

	    private void deleteNote(HttpServletRequest request) {
	        int id = Integer.parseInt(request.getParameter("id"));
	        notes.removeIf(note -> note.getId() == id);
	    }

	    private void editNote(HttpServletRequest request) {
	        int id = Integer.parseInt(request.getParameter("id"));
	        String title = request.getParameter("title");
	        String content = request.getParameter("content");
	        for (Note note : notes) {
	            if (note.getId() == id) {
	                note.setTitle(title);
	                note.setContent(content);
	                break;
	            }
	        }
	    
	
	}

}
