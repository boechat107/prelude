(prelude-require-packages '(evil-collection origami jinx))

;; The latest version of "key-chord" produced constant failures. This is
;; reported in this issue:
;; https://github.com/emacsorphanage/key-chord/issues/6.
;; I found that "quelpa" allows version pinning. I'm pinning here the latest
;; working version of "key-chord".
(quelpa
  '(key-chord
   :fetcher github
   :repo "emacsorphanage/key-chord"
   :commit "68264d09593e69c1d4773859ac570bd9feb008d9"))

(require 'key-chord)
(require 'evil)

;; Alternative escape key definition.
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-mode +1)

;; Makes the "redo" system work.
(evil-set-undo-system 'undo-tree)

;; Collection of "evil" configurations.
(evil-collection-init)

;; Makes it similar to easymotion on Vim.
(evil-define-key 'normal 'global
  (kbd "SPC") 'evil-avy-goto-char-2
  "+" 'evil-window-increase-height
  "-" 'evil-window-decrease-height)

(evil-define-key 'insert 'global
  (kbd "C-x C-f") 'company-files)

(require 'jinx)
(evil-define-key 'normal 'jinx-mode-map
  "z=" 'jinx-correct-word)

;; Better folding shortcut.
(require 'hideshow)
(require 'origami)

;; `evil-define-key' automatically delays the execution with
;; `after-load-functions' if necessary.
(evil-define-key 'normal hs-minor-mode-map
    "zm" 'hs-hide-level
    "zM" 'evil-close-folds
    "zp" 'personal-evil-hs-fold-focus)

(evil-define-key 'normal origami-mode-map
    ;; Open and close folds.
    "zA" 'origami-recursively-toggle-node
    "zp" 'personal-evil-fold-focus
    "zM" 'evil-close-folds
    ;; Navigating through folds.
    "zj" 'origami-next-fold
    "zk" 'origami-previous-fold)

(with-eval-after-load 'hideshow
  (defun personal-evil-hs-fold-focus (buffer point)
    (interactive (list (current-buffer) (point)))
    (evil-close-folds)
    (evil-open-fold))

  (setq hs-hide-comments-when-hiding-all nil))

(with-eval-after-load 'origami
  ; TODO: define function and add as a hook.
  (defun personal-evil-fold-focus (buffer point)
    (interactive (list (current-buffer) (point)))
    (origami-show-only-node buffer point)
    (origami-open-node-recursively buffer point)))

(with-eval-after-load 'evil
  (defalias #'forward-evil-word #'forward-evil-symbol))
