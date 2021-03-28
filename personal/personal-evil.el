(prelude-require-packages '(key-chord))

(require 'prelude-evil)
(require 'key-chord)

;; Makes the "redo" system work.
(evil-set-undo-system 'undo-tree)

;; Alternative escape key definition.
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-mode 1)

;; Collection of "evil" configurations.
(prelude-require-packages '(evil-collection))
(evil-collection-init)

;; Makes it similar to easymotion on Vim.
(define-key evil-normal-state-map (kbd "SPC") 'avy-goto-char)

;; Shortcuts to increase/decrease window's height.
(define-key evil-normal-state-map (kbd "+") 'evil-window-increase-height)
(define-key evil-normal-state-map (kbd "-") 'evil-window-decrease-height)

;; Better folding shortcut.
(require 'hideshow)
(define-key evil-normal-state-map (kbd "zm") 'hs-hide-level)
(define-key evil-normal-state-map (kbd "zM") 'hs-hide-all)

(provide 'personal-evil)
