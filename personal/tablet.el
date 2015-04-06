

(setq tablet-image-ctr 1)

(defun tablet-insert-new-image (w h c shouldOpen)
  ;; check the directory
  (if (not (file-exists-p (concat (buffer-name) "_files")))
      (progn
        (message (concat "make-directory: " (concat (buffer-name) "_files")))
        (make-directory (concat (buffer-name) "_files"))))
  ;; get the next image name
  (setq tablet-image-ctr (tablet-get-next-index tablet-image-ctr))
  (let ((fname (tablet-generate-file-name-with-index tablet-image-ctr)))
    (message (concat "opening " fname))
    (tablet-create-empty-image w h c fname)
    (if shouldOpen (tablet-open-new-file fname))
    (list (concat default-directory fname) tablet-image-ctr)))




(defun tablet-org-image-link (fname desc)
  (format "#+CAPTION: %s\n#+LABEL: fig:%s\n[[file:%s]]" desc desc fname))



(defun tablet-create-empty-image (w h c fname)
  (call-process "convert"
                 nil
                 nil
                 nil
                 "-size"
                 (concat (number-to-string w) "x" (number-to-string h))
                 c ;"xc:transparent"
                 (concat "PNG32:" fname)))

(defun tablet-get-next-index (ind)
  (catch 'break
    (loop do
          (let ((fname1 (tablet-generate-file-name-with-index ind)))
            (message fname1)
            (if (not (file-exists-p fname1))
                (throw 'break ind)))
          (setq ind (+ 1 ind))
          while t)
    ))

(defun tablet-generate-file-name-with-index (ind)
  (concat (buffer-name) "_files/" "IMG_" (format "%04d" ind) ".png"))

(defun tablet-open-new-file--paint (fname)
  (start-process "open"
                (get-buffer-create "*Messages*")
                "open"
                "-a"
                "/Applications/Paintbrush.app"
                fname))

(defun tablet-open-new-file--skitch (fname)
  (start-process "open"
                (get-buffer-create "*Messages*")
                "open"
                "-a"
                "/Applications/Skitch.app"
                fname))

(defun tablet-open-new-file--seashore (fname)
  (start-process "open"
                (get-buffer-create "*Messages*")
                "open"
                "-a"
                "/Applications/Seashore.app"
                fname))

(defun tablet-open-new-file--tabletDraw (fname)
  (start-process "open"
                (get-buffer-create "*Messages*")
                "open"
                "-a"
                "/Applications/TabletDraw.app"
                fname))

(defun tablet-open-new-file--pencil (fname)
  (start-process "open"
                (get-buffer-create "*Messages*")
                "open"
                "-a"
                "/Applications/Pencil.app"
                fname))

(defun tablet-open-new-file--sketchbookExpress (fname)
  (start-process "open"
                (get-buffer-create "*Messages*")
                "open"
                "-a"
                "/Applications/SketchBookExpress.app"
                fname))


;; Choose which program to open the image with
(setf (symbol-function 'tablet-open-new-file) (function tablet-open-new-file--sketchbookExpress))




(defun tablet-create-image-and-org-link (w h c)
  (interactive)
  (let* ((nxtImg (tablet-insert-new-image w h c 1))
         (defaultLabel (format "Image%d" (cadr nxtImg)))
         (actualLabel (read-string (format "Label [%s]:" defaultLabel))))
    (if (string= "" actualLabel)
        (setq actualLabel defaultLabel))
    (insert (tablet-org-image-link (tablet-generate-file-name-with-index (cadr nxtImg)) actualLabel))))




(defun tablet-create-white-page-and-org-link ()
  (interactive)
  (tablet-create-image-and-org-link 840 1188 "xc:white"))

(defun tablet-create-transparent-page-and-org-link ()
  (interactive)
  (tablet-create-image-and-org-link 840 1188 "xc:transparent"))

(defun tablet-create-white-image-and-org-link ()
  (interactive)
  (tablet-create-image-and-org-link 800 600 "xc:white"))

(defun tablet-create-transparent-image-and-org-link ()
  (interactive)
  (tablet-create-image-and-org-link 800 600 "xc:transparent"))



(defun tablet-create-default-page-and-org-link ()
  (interactive)
  (tablet-create-white-page-and-org-link))


(defun tablet-create-default-image-and-org-link ()
  (interactive)
  (tablet-create-transparent-image-and-org-link))


(defun tablet-trim-images ()
  (interactive)
  (let ((ind 1))
    (catch 'break
      (loop do
            (let ((fname1 (tablet-generate-file-name-with-index ind)))
              (if (not (file-exists-p fname1))
                  (throw 'break nil))
              (message (concat "Trimming " fname1))
              (tablet-trim-image fname1))
            (setq ind (+ 1 ind))
            while t)
    )))

(defun tablet-trim-image (fname)
  (call-process "convert"
                 nil
                 nil
                 nil
                 "-trim"
                 fname
                 fname))





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Trivial mode (open with external program)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (defun define-trivial-mode(mode-prefix file-regexp command)
;;   (setq command (append (list mode-prefix nil) command))
;;   (let ((mode-command (intern (concat mode-prefix "-mode"))))
;;     (add-to-list 'auto-mode-alist (cons file-regexp
;;                                         `(lambda ()
;;                                            (interactive)
;;                                            (toggle-read-only t)
;;                                           (define-trivial-mode-sp-func (buffer-file-name)))
;;                                           (kill-buffer (current-buffer))))))

(defun define-trivial-mode-seashore ()
  (interactive)
  (toggle-read-only t)
  (start-process "open" nil "open" "-a" "/Applications/Seashore.app" (buffer-file-name))
  (kill-buffer (current-buffer)))

(defun define-trivial-mode-tabletDraw ()
  (interactive)
  (toggle-read-only t)
  (start-process "open" nil "open" "-a" "/Applications/TabletDraw.app" (buffer-file-name))
  (kill-buffer (current-buffer)))

(defun define-trivial-mode-pencil ()
  (interactive)
  (toggle-read-only t)
  (start-process "open" nil "open" "-a" "/Applications/Pencil.app" (buffer-file-name))
  (kill-buffer (current-buffer)))


(defun define-trivial-mode-skitch ()
  (interactive)
  (toggle-read-only t)
  (start-process "open" nil "open" "-a" "/Applications/Skitch.app" (buffer-file-name))
  (kill-buffer (current-buffer)))

(defun define-trivial-mode-sketchbookExpress ()
  (interactive)
  (toggle-read-only t)
  (start-process "open" nil "open" "-a" "/Applications/SketchBookExpress.app" (buffer-file-name))
  (kill-buffer (current-buffer)))


(add-to-list 'auto-mode-alist (cons "\\.png$" 'define-trivial-mode-sketchbookExpress))

(defun define-trivial-mode-sp-func (mode-prefix command)
  (lambda (fname)
    (apply #'start-process (append (mode-prefix nil) command (list fname)))))

;; (define-trivial-mode "open" "\\.pdf$" (list "open"))
;; (define-trivial-mode "open" "\\.png$" (list "open" "-a" "/Applications/Seashore.app"))
