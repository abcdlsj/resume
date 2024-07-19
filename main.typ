#import "cv.typ": *;

#let Chinese = 0
#let EnglishFull = 1
#let Simplified = 2
#let runReader(mode) = {
  let translate(zh: [], en: []) = {
    if mode == Chinese {
      zh
    } else {
      en
    }
  }
  let noSimple(simple: [], content) = {
    if mode == Simplified {
      simple
    } else {
      content
    }
  }
  let months = (
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  )
  let translate-date(month, year) = translate(
    zh: [#year 年 #month 月],
    en: [#months.at(month - 1), #year],
  )
  let current = translate(
    zh: [至今],
    en: [Present],
  )

  let edu = {
    translate(en: [== Education], zh: [== 教育经历])
    let psu-date = [#translate-date(9, 2017) -- #translate-date(7, 2021)]
    translate(
      en: cventry(
        tl: [Bachelor's Degree in Electronic Information Science and Technology, *HeFei University of Technology*],
        tr: psu-date,
      )[],
      zh: cventry(
        tl: [合肥工业大学,电子信息科学与技术专业，本科],
        tr: psu-date,
      )[],
    )
  }

  let shopeework = {
    translate(
      en: [=== *Shopee Inc.*, ShenZheng, China],
      zh: [=== 深圳虾皮信息科技发展有限公司],
    )

    let openresty = link("https://openresty.org", "OpenResty")
    let spdesigns = ("统一弹窗", "侧边栏", "审核系统")
    let spjoin = ("问卷系统", "管理平台")
    let veticalproj = ("重构", "服务治理", "地区拆分", "容灾")
    let mids = ("数据库", "缓存", "消息中间件", "微服务", "可观测性")

    translate(
      en: cventry()[],
      zh: cventry(
        bl: [*Shopee 卖家平台*, 后端开发工程师],
        br: [#translate-date(7, 2021) -- #translate-date(2, 2023)],
      )[
        - 改进 Shopee 开放平台控制台功能，提高用户体验和参与度
        - 设计并实现了卖家中心#spdesigns.join("、")，参与并维护了#spjoin.join("、"))
      ],
    )

    translate(
      en: cventry()[],
      zh: cventry(
        bl: [*Shopee 开放平台*, 后端开发工程师],
        br: [#translate-date(7, 2021) -- #current],
      )[
        - 改进 Shopee 开放平台 Console 功能
        - 添加监控面板，维护并开发开放平台 Openresty 网关插件，Auth 以及 Report
        - 提高系统稳定性以及可观测性
        - 参与地区拆分方案（异地多活），以及容灾方案（同城多活）
        - 优化多地区 Shopee 推送系统，降低单次推送耗时（600ms->30ms）
        - 参与横向项目开发，如#veticalproj.join("、")
        - 设计并开发独立项目，如 Partner Voucher 项目
      ],
    )

    translate(
      en: [],
      zh: [
        "- 能熟练应用#mids.join("、")等中间件和后端开发技术",
        "- 熟悉#openresty，了解Shopee控制台",
        "- 具有独立设计和实施解决方案的能力,善于跨部门协作与沟通,有效管理项目进度并确保按时交付"
      ]
    )
  }

  let openservice = {
    cventry(
      tl: [*Open Service*],
      tr: link("https://open.shopee.com/"),
    )[]

    translate(
      en: [
      ],
      zh: [
        - 基于OpenResty插件系统实现OpenAPI调用上报统计功能(60k+QPS),数据经由 Kafka 传输到 ES 和 Hive/Clickhouse，为其他系统提供数据支持
        - 基于地区拆分方案，优化推送系统延迟，有效降低单次推送耗时（600ms->30ms）
        - 基于上报数据统计，添加多个控制台面板（调用统计、商业分析、日志搜索），以及惩罚任务
      ],
    )
  }


  let sellermisc = {
    cventry(
      tl: [*Seller 主站服务*],
      tr: link("https://open.shopee.com/"),
    )[]

    translate(
      en: [],
      zh: [
        - 主站服务包含弹窗、侧边栏和问卷系统等模块;内部广泛采用了异步加载、缓存和消息队列等技术,显著提升了网站响应速度和卖家体验
        - 功能开关项目用于灵活配置功能黑白名单,支持标签、版本管理和回滚等功能,便于部门内部使用和维护
      ],
    )
  }

  let partnervoucher = {
    cventry(
      tl: [*Partner Voucher*],
      tr: link("https://partnervoucher.shopee.co.id/"),
    )[]

    translate(
      en: [
      ],
      zh: [
        - 在线充值券码管理服务，提供组织管理、余额、订单和审批流等功能，提升用户体验和运营效率
        - 独立完成后端设计与开发，并与多个团队联调，负责推进项目开发部分并管理进度
      ],
    )
  }

  let gnar = {
    cventry(
      tl: [*Gnar*],
      tr: githublink("abcdlsj/gnar"),
    )[]

    translate(
      en: [
        - Intranet port forwarding tool, similar to Frp/Ngork
        - Forwarding protocol support TCP/UDP,using Yamux support multiplexing
      ],
      zh: [
        - 内网端口转发工具，类似于 Frp/Ngork
        - 转发协议支持 TCP/UDP，使用 Yamux 支持多路复用
      ],
    )
  }

  let cLsm = {
    cventry(
      tl: [*cLSM*],
      tr: githublink("abcdlsj/clsm"),
    )[]

    translate(
      en: [],
      zh: [
        - 基于 SkipList 的 LSM-Tree 数据结构实现
      ],
    )
  }

  let skills = {
    let devTools = {
      let tools = ("Jira", "Gitlab", "Confluence")
      translate(
        en: [
          - Tools: editor-agnostic, have experience with team tools like #tools.join(", ") and more.
        ],
        zh: [- 开发工具：善于使用日常工具和脚本，有使用 #tools.join("、") 等团队协作工具的经验。],
      )
    }
    let progLang = {
      let very = "Go"
      let somehow = ("Python", "Lua", "Cpp")
      translate(
        en: [
          - TODO.
        ],
        zh: [
          - 编程语言：熟悉#very，了解#somehow.join("、")。
        ],
      )
    }
    let systemNetwork = {
      let items = (
        "进程",
        "内存",
        "Linux",
        "多路复用",
        "容器化技术",
        "常见网络协议",
      )
      translate(
        en: [- ],
        zh: [- 操作系统 \& 网络：熟悉#items.join("、")。],
      )
    }
    progLang
    systemNetwork
    devTools
  }

  let misc = {
    translate(
      en: [

      ],
      zh: [
        - 喜欢实现 Small Side Project,包括 Go Git、Tfidf wiki 搜索引擎、BitTorrent downloader、IM bot、Static-Blog generator、line counter(Tokei/Scc)、Proxy(Frp/Ngork)、Serverless Framework、Pastebin 等等
        - 喜欢折腾和探索,热爱分享和记录
      ],
    )
  }

  translate(en: [= #smallcaps[Songjian Li]], zh: [= 李松健])

  [#emaillink("career@songjian.li") $dot.c$ #iconlink(
      "https://abcdlsj.github.io",
      icon: blog,
    ) $dot.c$ #iconlink(
      "https://github.com/abcdlsj",
      icon: github,
    )]
  edu

  translate(en: [== Work Experience], zh: [== 工作经历])
  shopeework

  translate(en: [== Related Projects], zh: [== 项目经历])
  openservice
  partnervoucher
  sellermisc

  translate(en: [== Personal Projects], zh: [== 个人项目])
  gnar
  cLsm

  translate(en: [== Skills], zh: [== 技能])
  skills

  translate(en: [== Misc], zh: [== 其它])
  misc
}
