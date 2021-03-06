;;MELPA
;;-----------------------:|:---------------------------
;; Install necessary python modules pip install jedi flake8 autopep8 black yapf
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))

; list the packages you want
(setq package-list
      '(snazzy-theme
	doom-theme
	magit
	multiple-cursors
	iedit
	flymd
	;; Python Stuff
	flycheck
	elpy
	move-text)
)

; activate all the packages
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(add-hook 'python-mode-hook 'elpy-mode 'flycheck-mode  'multiple-cursors-mode)
(elpy-enable)

;; Go to error PEP8
(global-set-key (kbd "C-,") 'flycheck-previous-error)
(global-set-key (kbd "C-.") 'flycheck-next-error)
(global-set-key (kbd "C-/") 'flycheck-list-errors)


;; PDB Shortcut
(defun pdb-set-trace ()
  "Import pdb and set breaking point"
  (interactive)
  (insert "import pdb; pdb.set_trace()"))
(global-set-key (kbd "C-x C-p") 'pdb-set-trace)

;; Organize improts, and run black formatter
(defun format-python-code()
  "Organize imports and format code"
  (interactive)
  (progn (py-isort-buffer)
	 (elpy-black-fix-code)
  )
)

;; Format code using black
(global-set-key (kbd "<f5>") 'format-python-code)
(global-set-key (kbd "<f6>") 'py-isort-buffer)
(global-set-key (kbd "<f7>") 'elpy-black-fix-code)
