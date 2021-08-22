;; ;;Load Packages

;; ;; Added by Package.el.  This must come before configurations of
;; ;; installed packages.  Don't delete this line.  If you don't want it,
;; ;; just comment it out by adding a semicolon to the start of the line.
;; ;; You may delete these explanatory comments.
;; ;;(debug-on-entry 'package-initialize)
;; (package-initialize)
;; ;;Load or install necessary packages

;; (require 'package)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/"))

;; ; list the packages you want
;; (setq package-list
;;       '(snazzy-theme
;; 	;; doom-theme
;; 	magit
;; 	multiple-cursors
;; 	iedit
;; 	find-file-in-project
;; 	;; Python Stuff
;; 	flycheck
;; 	elpy
;; 	)
;; )

;; ;; (load "~/.emacs.d/python/init-packages-python")

;; ; fetch the list of packages available 
;; (unless package-archive-contents
;;   (package-refresh-contents))

;; ; install the missing packages
;; (dolist (package package-list)
;;   (unless (package-installed-p package)
;;     (package-install package)))

;; TEST NEW PACKAGE MANAGER
(defvar bootstrap-version)
(let ((bootstrap-file
               (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
            (bootstrap-version 5))
    (unless (file-exists-p bootstrap-file)
          (with-current-buffer
                    (url-retrieve-synchronously
                               "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
                                        'silent 'inhibit-cookies)
                          (goto-char (point-max))
                                (eval-print-last-sexp)))
    (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(use-package helm
  :straight t
  :config
  (helm-mode 1)
  )
(use-package evil
  :straight t
  :config
  (evil-mode 1)
  (setq evil-undo-system 'undo-fu))
(use-package undo-fu
  :straight t
  :config
  (define-key evil-normal-state-map "u" 'undo-fu-only-undo)
  (define-key evil-normal-state-map "\C-r" 'undo-fu-only-redo))
(use-package flycheck
  :straight t
  :config
  (global-flycheck-mode 1)
  )
(use-package flycheck-pycheckers
  :straight t
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup)
  )
(straight-use-package 'projectile)
(straight-use-package 'fzf)
(straight-use-package 'elpygen)
(straight-use-package 'jedi-direx)
(straight-use-package 'anaconda-mode)
(straight-use-package 'jedi)
(straight-use-package 'railscasts-theme)
(straight-use-package 'humanoid-themes)
(straight-use-package 'sunburn-theme)
(straight-use-package 'atom-dark-theme)
(straight-use-package 'atom-one-dark-theme)
(straight-use-package 'kaolin-themes)
(straight-use-package 'blacken)
(straight-use-package 'yaml-mode)
(straight-use-package 'py-isort)
(straight-use-package 'iedit)
(straight-use-package 'badger-theme)
(straight-use-package 'csharp-mode)
(straight-use-package 'snazzy-theme)
(straight-use-package 'magit)
(straight-use-package 'multiple-cursors)
(straight-use-package 'iedit)
(straight-use-package 'find-file-in-project)
(straight-use-package 'elpy)

(elpy-enable)
(add-hook 'python-mode-hook 'elpy-mode 'multiple-cursors-mode)

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

;; Enable Zeep Shortcut
(defun enable-zeep-logging()
  "Import Zeep Loggin and Enable it"
  (interactive)
  (insert "from api_client.soap_client import enable_zeep_logging ; enable_zeep_logging()"))
(global-set-key (kbd "C-x C-z") 'pdb-set-trace)

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

;; Basic Emacs Configuration
;;-----------------------:|:---------------------------
;; Start Maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Remove Tool-bar, Menu bar and Scroll bar
(tool-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)

;; enable line numbers globally
(global-linum-mode t)

;; Highlight current line
(global-hl-line-mode +1)

;; Do not show initial Message
(setq inhibit-startup-message t)

;;Paranthesis highlighting
(show-paren-mode t)
(setq show-paren-style 'expression)

;; Custom Shortcuts and packages
;;-----------------------:|:---------------------------

(evil-mode)
;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;;LoadTheme
(global-set-key (kbd "C-x l") 'load-theme)
;; EVIL MODE CONFIRGURATION
;; -------------------------------------
(global-set-key (kbd "<f11>") 'evil-mode)
(global-set-key (kbd "<f10>") 'elpy-goto-definition)
(global-set-key (kbd "M-o") 'open-line)
;; Enable edit multiple Lines 
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)

;; Use lines for identation - highlight-indent-guides must be
;; installed within package manager
(setq highlight-indent-guides-method 'character)
(setq highlight-indent-guides-character ?\|)
;; iEdit Styff
;; Open iEdit if mode is not enabled
(global-set-key (kbd "C-;") 'iedit-mode)
(global-set-key (kbd "C-x r") 'iedit-replace-occurrences)
;; Mark Current Symbol
(setq iedit-current-symbol-default t
            iedit-only-at-symbol-boundaries t
	    iedit-toggle-key-default (kbd "C-;"))

;; Use lines for identation - highlight-indent-guides must be
;; installed within package manager
(setq highlight-indent-guides-method 'character)
(setq highlight-indent-guides-character ?\|)

;; Delete blank spaces and leave just one
(global-set-key (kbd "C-x <deletechar>") 'just-one-space)

;; Preview Live MarkDown
(global-set-key (kbd "C-x RET C-d") 'flymd-flyit)

;; Find File by string search
(global-set-key (kbd "<f9>") 'find-file-in-project)

;; Transpose Lines up or down
(global-set-key (kbd "M-n") 'move-text-down)
(global-set-key (kbd "M-p") 'move-text-up)

;; Window Management
;;-----------------------:|:---------------------------
;; Resize Windows with Ctrl+Shift+ArrowKeys
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Move windows like i3
(global-set-key (kbd "C-c h") 'windmove-left)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c j") 'windmove-down)
(global-set-key (kbd "C-c k") 'windmove-up)

;; Setup split Windows 
(defun split-window-3()
 "Splite window into 3 equal windows"
 (interactive)
 (if (= 1 (length (window-list)))
     (progn (split-window-horizontally)
	    (split-window-horizontally)
	    (balance-windows)
	    )
   )
)
(global-set-key (kbd "C-c 3") 'split-window-3)

;;Load desired hooks
;; (load "~/.emacs.d/python/init-packages-python")
;;(load "~/.emacs.d/csharp/init-packages-csharp")

;; file backups
(setq version-control t     ;; Use version numbers for backups.
      kept-new-versions 10  ;; Number of newest versions to keep.
      kept-old-versions 0   ;; Number of oldest versions to keep.
      delete-old-versions t ;; Don't ask to delete excess backup versions.
      backup-by-copying t)  ;; Copy all files, don't rename them.

(setq vc-make-backup-files t)

;; Default and per-save backups go here:
(setq backup-directory-alist '(("" . "~/.emacs.d/backup/per-save")))

(defun force-backup-of-buffer ()
  ;; Make a special "per session" backup at the first save of each
  ;; emacs session.
  (when (not buffer-backed-up)
    ;; Override the default parameters for per-session backups.
    (let ((backup-directory-alist '(("" . "~/.emacs.d/backup/per-session")))
          (kept-new-versions 3))
      (backup-buffer)))
  ;; Make a "per save" backup on each save.  The first save results in
  ;; both a per-session and a per-save backup, to keep the numbering
  ;; of per-save backups consistent.
  (let ((buffer-backed-up nil))
    (backup-buffer)))

(add-hook 'before-save-hook  'force-backup-of-buffer)


;; This can be deleted before pushing to github
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("b8929cff63ffc759e436b0f0575d15a8ad7658932f4b2c99415f3dde09b32e97" "389677f10ba34e91eb9d0dfa1a59918fe3e4a1a0fe346090d516ce4030cd59ed" "e068203104e27ac7eeff924521112bfcd953a655269a8da660ebc150c97d0db8" "f00a605fb19cb258ad7e0d99c007f226f24d767d01bf31f3828ce6688cbdeb22" "73320ccc14ab4987fe2e97cfd810b33a1f4a115f5f056c482c3d38a4429e1705" "643b4d181b6afa4306d65db76889d8b987e095ae8f262a4c71dd5669d39c9b09" "ab3bf0dd6507d10dcf1b63769e7bfc180d8332266d3db27cc7b2e8323ff02ae4" "34ed3e2fa4a1cb2ce7400c7f1a6c8f12931d8021435bad841fdc1192bd1cc7da" "37046960cf667c5ab3b76235d35a5db4763c531e706502a9067fa78db5a775c0" "10845272b6fa47a6cdfc49816748bdb1dc1cb9be647801c25c054a8e6a27ef72" "8ce796252a78d1a69e008c39d7b84a9545022b64609caac98dc7980d76ae34e3" "3de3f36a398d2c8a4796360bfce1fa515292e9f76b655bb9a377289a6a80a132" "b35a14c7d94c1f411890d45edfb9dc1bd61c5becd5c326790b51df6ebf60f402" "1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "17a58e509bbb8318abf3558c4b7b44273b4f1b555c5e91d00d4785b7b59d6d28" "6a0d7f41968908e25b2f56fa7b4d188e3fc9a158c39ef680b349dccffc42d1c8" "3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "d1b4990bd599f5e2186c3f75769a2c5334063e9e541e37514942c27975700370" "5b7c31eb904d50c470ce264318f41b3bbc85545e4359e6b7d48ee88a892b1915" "830c887bd2cefd77326ddf24389f3806c2a561a550e309691933f772f1bc5825" "8ca8fbaeaeff06ac803d7c42de1430b9765d22a439efc45b5ac572c2d9d09b16" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "151bde695af0b0e69c3846500f58d9a0ca8cb2d447da68d7fbf4154dcf818ebc" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "c499bf4e774b34e784ef5a104347b81c56220416d56d5fd3fd85df8704260aad" "7e5d400035eea68343be6830f3de7b8ce5e75f7ac7b8337b5df492d023ee8483" "c1c459af570241993823db87096bc775506c378aa02c9c6cd9ccaa8247056b96" "bb28b083fe1c61848c10c049be076afc572ea9bee6e1f8dc2631c5ee4f7388c8" "9089d25e2a77e6044b4a97a2b9fe0c82351a19fdd3e68a885f40f86bbe3b3900" "e7b49145d311e86da34a32a7e1f73497fa365110a813d2ecd8105eaa551969da" "b3bcf1b12ef2a7606c7697d71b934ca0bdd495d52f901e73ce008c4c9825a3aa" "46720e46428c490e7b2ddeafc2112c5a796c8cf4af71bd6b758d5c19316aff06" "91375c6dc506913ac7488f655b5afe934f343a0b223021c349105d37748c6696" "c11d033a3099ded27b4dde505fdb2232ae9996f7e4becac351c90b92d9b48f07" "0e8bac1e87493f6954faf5a62e1356ec9365bd5c33398af3e83cfdf662ad955f" default))
 '(elpy-rpc-python-command "python2"))
 ;; '(package-selected-packages
   ;; '(## projectile helm fzf elpygen jedi-direx anaconda-mode jedi railscasts-theme humanoid-themes sunburn-theme atom-dark-theme atom-one-dark-theme kaolin-themes blacken yaml-mode py-isort iedit evil badger-theme csharp-mode doom-themes snazzy-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load-theme 'kaolin-bubblegum)
