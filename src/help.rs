//! Terminal help text — one function per topic, all text via i18n keys.

use crate::i18n::{t, tf};

pub fn dispatch(subtopic: &str) -> Vec<String> {
    match subtopic {
        "" => overview(),
        "msg" => messaging(),
        "ma" => ma(),
        "ma/entry" => ma_entry(),
        "path" => path(),
        "my" => my(),
        "inbox" => inbox(),
        "doc" => doc(),
        "actor" => actor(),
        "url" => url(),
        "publish" => publish(),
        "i18n" => i18n(),
        other => vec![tf("help-unknown-topic", &[("topic", other)])],
    }
}

fn overview() -> Vec<String> {
    vec![
        t("help-header-zion"),
        t("help-cmd-help"),
        t("help-cmd-clear"),
        t("help-cmd-history"),
        t("help-cmd-panic"),
        t("help-cmd-logout"),
        t("help-cmd-batch"),
        t("help-cmd-batch-sync"),
        String::new(),
        t("help-header-topics"),
        t("help-topic-msg"),
        t("help-topic-ma"),
        t("help-topic-path"),
        t("help-topic-my"),
        t("help-topic-inbox"),
        t("help-topic-doc"),
        t("help-topic-actor"),
        t("help-topic-url"),
        t("help-topic-publish"),
        t("help-topic-i18n"),
        t("help-footer"),
    ]
}

fn messaging() -> Vec<String> {
    vec![
        t("help-header-messaging"),
        t("help-msg-echo"),
        t("help-msg-send"),
        t("help-msg-fragment"),
        t("help-msg-escape"),
        t("help-footer"),
    ]
}

fn ma() -> Vec<String> {
    vec![
        t("help-header-ma"),
        t("help-ma-intro"),
        t("help-ma-command"),
        t("help-ma-publish"),
        t("help-ma-security"),
        t("help-ma-links"),
        t("help-ma-entry-topic"),
        t("help-footer"),
    ]
}

fn ma_entry() -> Vec<String> {
    vec![
        t("help-header-ma-entry"),
        t("help-ma-entry-intro"),
        t("help-ma-entry-steps"),
        t("help-ma-entry-command"),
        t("help-ma-entry-leave"),
        t("help-ma-entry-url"),
        t("help-footer"),
    ]
}

fn path() -> Vec<String> {
    vec![
        t("help-header-config"),
        t("help-config-get"),
        t("help-config-filter"),
        t("help-config-set"),
        t("help-config-delete"),
        t("help-config-verb"),
        t("help-footer"),
    ]
}

fn my() -> Vec<String> {
    vec![
        t("help-header-common"),
        t("help-my"),
        t("help-aliases"),
        t("help-aliases-set"),
        t("help-aliases-del"),
        String::new(),
        t("help-runtime-discover"),
        String::new(),
        t("help-identity"),
        t("help-identity-did"),
        t("help-identity-publish"),
        t("help-identity-export"),
        String::new(),
        t("help-config-path"),
        t("help-footer"),
    ]
}

fn inbox() -> Vec<String> {
    vec![
        t("help-header-inbox"),
        t("help-inbox"),
        t("help-inbox-n"),
        t("help-inbox-from"),
        t("help-inbox-reply"),
        t("help-inbox-open"),
        t("help-inbox-del"),
        t("help-inbox-delall"),
        t("help-inbox-flush"),
        t("help-inbox-filter"),
        t("help-inbox-traverse"),
        t("help-footer"),
    ]
}

fn doc() -> Vec<String> {
    vec![
        t("help-header-documents"),
        t("help-doc-edit"),
        t("help-doc-edit-cid"),
        t("help-doc-eval"),
        t("help-doc-publish"),
        t("help-doc-publish-ipld"),
        t("help-doc-fetch"),
        t("help-doc-del"),
        t("help-footer"),
    ]
}

fn actor() -> Vec<String> {
    vec![
        t("help-header-actor"),
        t("help-actor-echo"),
        t("help-actor-text"),
        t("help-actor-ping"),
        String::new(),
        t("help-actor-entities"),
        t("help-actor-entities-get"),
        t("help-actor-entities-set"),
        t("help-actor-entities-edit"),
        t("help-actor-entities-del"),
        String::new(),
        t("help-actor-config-get"),
        t("help-actor-config-set"),
        String::new(),
        t("help-actor-acl"),
        t("help-actor-acl-edit"),
        String::new(),
        t("help-actor-fragment"),
        t("help-actor-fragment-verb"),
        String::new(),
        t("help-header-cid-ops"),
        t("help-actor-cat"),
        t("help-actor-head"),
        t("help-actor-tail"),
        t("help-actor-wc"),
        t("help-actor-wc-l"),
        t("help-footer"),
    ]
}

fn url() -> Vec<String> {
    vec![
        t("help-header-url"),
        t("help-url-intro"),
        t("help-url-msg"),
        t("help-url-say"),
        t("help-url-emote"),
        t("help-url-ma"),
        t("help-url-enter"),
        t("help-url-example"),
        t("help-url-note"),
        t("help-footer"),
    ]
}

fn publish() -> Vec<String> {
    vec![
        t("help-header-publish"),
        String::new(),
        t("help-publish-intro"),
        t("help-publish-ma"),
        t("help-publish-steps"),
        t("help-publish-without"),
        t("help-footer"),
    ]
}

fn i18n() -> Vec<String> {
    vec![
        t("help-header-i18n"),
        t("help-i18n-intro"),
        t("help-i18n-set"),
        t("help-i18n-list"),
        t("help-footer"),
    ]
}
