;;; deprecated.el -*- lexical-binding: t; -*-


;; Stuff that's deprecated but maybe one day useful...
;;


  ;; Gant char stuff
 (defun prop_ ()
   (interactive)
   (setq properties-list '(":TYPE: Task" ":DEP: none" ":PROGRESS: 0"))

   (insert ":PROPERTIES:\n")
   (org-cycle)

   (dolist (elt properties-list)
     (insert  elt)
     (insert "\n")
     (org-cycle)
     )
   (insert ":END:\n"))
 (global-set-key (kbd "C-=") 'prop_)


  (defun get_all_headings (arr deep)
   (let ( (size (length arr)) (i 2));;get the size of the arr
     (while ( < i size );;iterate for each headings/subheadings
	(setq name (plist-get (elt (elt arr i) 1) :title))
	(setq scheduled (plist-get (elt (elt arr i) 1) :scheduled))
	(setq deadline (plist-get (elt (elt arr i) 1) :deadline))
	(setq todo (plist-get (elt (elt arr i) 1) :todo-type))
	(setq priority (plist-get (elt (elt arr i) 1) :priority))
	(setq l nil)
	(add-to-list 'l name)
	(add-to-list 'l deep)
	(if priority nil (setq priority 100))
	(add-to-list 'l priority)
	(add-to-list 'l  "na")

	(setq scheduled_vect nil)
	(if scheduled
	    (let ((tt (elt scheduled 1)) )
	      (add-to-list 'l t)
	      (setq ys (plist-get tt :year-start))
	      (setq ms (plist-get tt :month-start))
	      (setq ds (plist-get tt :day-start))
	      (setq hs (plist-get tt :hour-start))
	      (setq mins (plist-get tt :minute-start))
	      (unless hs (setq hs 0) )
	      (unless mins (setq mins 0) )
	      (setq ts (+ (* (- ys 2020) 8760) (* (calendar-day-number (list ms ds ys)) 24) hs (/ mins 60.0)))
	      (setq scheduled_vect (vector ts hs ds ms ys))
	      )
	  )

	(setq deadline_vect nil)
	(if deadline
	    (let ((tt (elt deadline 1)) )

	      (add-to-list 'l t)
	      (setq ysd (plist-get tt :year-start))
	      (setq msd (plist-get tt :month-start))
	      (setq dsd (plist-get tt :day-start))
	      (setq hsd (plist-get tt :hour-start))
	      (setq minsd (plist-get tt :minute-start))
	      (unless hsd (setq hsd 0) )
	      (unless minsd (setq minsd 0) )
	      (setq tsd (+ (* (- ysd 2020) 8760) (* (calendar-day-number (list msd dsd ysd)) 24) hsd (/ minsd 60.0)))
	      (setq deadline_vect (vector tsd hsd dsd msd ysd))
	      )
	  (if scheduled
	      (setq deadline_vect (vector (1+ ts) hs ds ms ys))
	    nil
	    )
	  )
	(if scheduled
	    (let ((a 1))
	      (add-to-list 'l (vector scheduled_vect deadline_vect))
	      (if (> minT ts)
		  (setq minT ts)
		nil)
	      (if (< maxT tsd)
		  (setq maxT tsd)
		nil)
	      )
	  (add-to-list 'l nil)
	  )

	(if (< (elt (reverse l) 2) 68)
	    (let ((a 1))
	      (add-to-list 'ordered_arr (reverse l))
	      (get_all_headings (elt arr i) (1+ deep))
	      )
	  nil
	  )
	(setq i (1+ i))
	)
     )

   )


 (defun draw-gantt ()
   "draw a gantt svg "
   (interactive)
   (get-org-heading-info)
   (require 'svg)
   (setq H 600)
   (setq W (window-pixel-width ))
   (setq sx 150)
   (setq sy 25)
   (setq Fsize 10)
   (setq svg (svg-create W H :stroke "black" ))
   (svg-rectangle svg 0 0 W H :fill "#ffffff" :stroke-width 0)

   (setq size (length ordered_arr))
   (setq i 0)
   (setq arr (reverse ordered_arr))
   (setq dt (float (- maxT minT)))
   (setq dx (float (- W sx)))
   (while (< i size)
     (let ((deep (elt (elt arr i) 1))
	    (name (elt (elt arr i) 0))
	    (visible (elt (elt arr i) 4)) )

	(if (= deep 0)
	    (svg-line svg 0 (+ sy (+ 2 (* i (+ Fsize 4)))) W (+ sy (+ 2 (* i (+ Fsize 4)))))
	  nil
	  )

	(svg-text svg name :x (+ 3 (* 8 deep)) :y (+ sy (* i (+ Fsize 4))) :stroke-width 0.5 :font-size (concat (number-to-string Fsize) "px") :font-family "Helvetica")
	(if visible
	    (let ((ts (elt (elt (elt (elt arr i) 5) 0) 0))
		  (te (elt (elt (elt (elt arr i) 5) 1) 0)))

	      (svg-rectangle svg  (+ sx (* dx (/ (- ts minT) dt))) (+ (- sy Fsize) 1 (* i (+ Fsize 4)))  (* dx (/ (- te ts) dt)) (+ -2 Fsize) :fill (color-cycle i size))
	      (if (< (elt (elt arr i) 2) 68 )
		  (let ( (day  (elt (elt (elt (elt arr i) 5) 0) 2))
			 (month  (elt (elt (elt (elt arr i) 5) 0) 3)) )
		    (svg-line svg (+ sx (* dx (/ (- ts minT) dt))) (- (- sy Fsize) 2) (+ sx (* dx (/ (- ts minT) dt))) H :stroke-dasharray 4)
		    (svg-text svg (format "%02d/%02d" day month) :x (- (+ sx (* dx (/ (- ts minT) dt))) 15) :y (+ Fsize 1) :stroke-width 0.5 :font-size (concat (number-to-string Fsize) "px") :font-family "Helvetica")
		    )
		)
	      )
	  nil
	  )
	(setq i (1+ i))
	)
     )
   (setq tnow (+ (* (- (elt (calendar-current-date) 2) 2020) 8760) (* (calendar-day-number (calendar-current-date)) 24)))
   (if (> tnow minT)
	(let ((a 1))
	  (svg-line svg (+ sx (* dx (/ (- tnow minT) dt))) (- (- sy Fsize) 2) (+ sx (* dx (/ (- tnow minT) dt))) H :stroke-dasharray 4 :stroke "red")
	  )
     nil
     )
   ;; create or get a gantt buffer
   (let (($buf (get-buffer-create "*gantt*")))
     (with-current-buffer $buf
	(erase-buffer)
	(svg-insert-image svg));;insert the svh
     (display-buffer-in-side-window $buf `((side . bottom)
					    (window-height . ,(+ 2 size)) ;;backquote + coma to evaluate var
					    (slot . 0)));;display the window at the bottom
     )
   )
 (global-set-key (kbd "C-=") 'draw-gantt)
