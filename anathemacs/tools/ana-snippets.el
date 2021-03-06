;;; ana-snippets.el --- Init ivy, company, counsel

;;; Commentary:
;;
;;

;;; Code:
(use-package yasnippet
  :delight yas-minor-mode
  :init
  (yas-global-mode t)
  (ha-leader-def
    "s." 'yas-minor-mode
    "sf" 'yas-visit-snippet-file
    "si" 'yas-insert-snippet
    "sn" 'yas-new-snippet))

(use-package yasnippet-snippets
  :init
  (ha-leader-def
    "sd" 'yas-describe-tables))

(use-package helm-c-yasnippet
  :general
  (cc-leader-def
    "y" 'helm-yas-complete)
  :config
  (setq helm-yas-space-match-any-greedy t))
(provide 'ana-snippets)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ana-snippets.el ends here
