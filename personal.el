(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "M-.") 'godef-jump)))
(add-hook 'go-mode-hook
  (lambda ()
    (setq-default)
    (setq tab-width 2)
    (setq standard-indent 2)
    (setq indent-tabs-mode nil)))

(add-hook 'go-mode-hook
          (lambda ()
            (if (not (string-match "go" compile-command))
                (set (make-local-variable 'compile-command)
                     "go build -v && go test -v && go vet"))
))

;Go Oracle
(load-file "$GOPATH/src/code.google.com/p/go.tools/cmd/oracle/oracle.el")

(add-hook 'go-mode-hook
          (lambda ()
;;            (go-oracle-mode)
            (auto-complete-mode)
            (whitespace-mode 0)
            (linum-mode)
;;            (flycheck-list-errors)
)
)

;; goimports
(setq gofmt-command "goimports")
(add-to-list 'load-path "/usr/local/Cellar/go/1.3/libexec/misc/emacs/")
(require 'go-mode-load)
(add-hook 'before-save-hook 'gofmt-before-save)

;; auto-complete
(require 'auto-complete)

;; go-autocomplete
(require 'go-autocomplete)
(require 'auto-complete-config)

;; linum-format
(setq linum-format "%d ")

;; global highlight current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "#111e1f")
(set-face-foreground 'highlight nil)
;(custom-set-faces
 ; '(highlight ((t (:foreground nil :bold t)))) )
