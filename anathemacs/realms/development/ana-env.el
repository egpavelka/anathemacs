;;; ana-env.el ---

;; Author: e.g. pavelka <pav@egpavelka.com>
;; URL: https://github.com/egpavelka/anathemacs

;;; Commentary:
;;
;;

;;; Code:

(use-package dash-docs
  :config
  (setq dash-docs-common-docsets '(;; "Bootstrap 4"
                                   ;; "C++"
                                   ;; "CSS"
                                   ;; "Django"
                                   ;; "Elixir"
                                   ;; "Emacs Lisp"
                                   ;; "Erlang"
                                   ;; "Flask"
                                   "Font_Awesome"
                                   ;; "Go"
                                   ;; "Haskell"
                                   ;; "HTML"
                                   ;; "JavaScript"
                                   ;; "jQuery"
                                   "LaTeX"
                                   ;; "Lua"
                                   ;; "MATLAB"
                                   ;; "Matplotlib"
                                   "MySQL"
                                   ;; "Nginx"
                                   ;; "NodeJS"
                                   ;; "NumPy"
                                   ;; "Pandas"
                                   "PostgreSQL"
                                   "Python 3"
                                   "R"
                                   ;; "React"
                                   ;; "Ruby"
                                   ;; "Ruby on Rails"
                                   ;; "SciPy"
                                   ;; "SQLAlchemy"
                                   "SQLite"
                                   ;; "TypeScript"
                                   ;; "VueJS"
                                   )))

(use-package direnv
  :config
  (direnv-mode))

;; (use-package ggtags)

(provide 'ana-env)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ana-env.el ends here
