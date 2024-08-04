#let dividerline() = {
  v(-3pt)
  line(length: 100%, stroke: gray)
  v(-8pt)
}

#let fa(name) = {
  text(
    font: "Font Awesome 6 Free Solid",
    box[ #name ],
  )
}

#let link-icon = symbol("\u{f0c1}")

#let github = symbol("\u{f09b}")
#let blog = symbol("\u{f09e}")
#let email = symbol("\u{f0e0}")
#let phone = symbol("\u{f095}")

#let iconlink(
  uri,
  text: [],
  icon: link-icon,
) = {
  if text == [] {
    text = uri
  }
  link(uri)[#fa[#icon] #text]
}

#let githublink(userRepo) = {
  link("https://github.com/" + userRepo)[#fa[#github] #userRepo]
}

#let emaillink(emailaddr) = {
  link("mailto:" + emailaddr)[#fa[#email] #emailaddr]
}

#let cventry(
  tl: "",
  tr: "",
  bl: [],
  br: [],
  content,
) = {
  block(
    inset: (left: 0pt),
    if tl != "" or tr != "" {
      tl + h(1fr) + tr + linebreak()
    } + if bl != [] or br != [] {
      bl + h(1fr) + br + linebreak()
    } + content,
  )
}

#let cv(body) = {
  set par(justify: true)

  show heading.where(level: 1): set text(
    size: 18pt,
    weight: "light",
  )

  let the-font = (
    "Palatino",
    "PingFang SC",
  )

  show heading.where(level: 2): it => text(
    size: 12pt,
    font: the-font,
    weight: "bold",
    block(dividerline() + it),
  )

  set list(indent: 2pt)
  set text(
    font: the-font,
    size: 10pt,
  )

  show link: it => underline(offset: 2pt, it)
  set page(
    margin: (x: 1.2cm, y: 0.5cm),
    numbering: "1 / 1",
  )
  set par(justify: true)

  body
}

#let newpage = {
  set page(margin: (x: 1.2cm, y: 0.5cm), numbering: "1 / 1")
  set par(justify: true)
}

#let Chinese = 0
#let English = 1
#let runReader(mode) = {
  let translate(zh: [], en: []) = {
    if mode == Chinese {
      zh
    } else {
      en
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
        tl: [合肥工业大学，电子信息科学与技术专业，计算机学院，本科],
        tr: psu-date,
      )[],
    )
  }

  let shopeework = {
    translate(
      en: cventry(
        tl: [*Shopee Inc.*, ShenZheng, China],
        tr: [#translate-date(7, 2021) -- #current],
      )[],
      zh: cventry(
        tl: [深圳虾皮信息科技发展有限公司],
        tr: [#translate-date(7, 2021) -- #current],
      )[],
    )

    translate(
      en: cventry(
        bl: [*Shopee Seller Platform*, Backend Development],
        br: [#translate-date(7, 2021) -- #translate-date(1, 2023)],
      )[
        - Business overview: The seller platform is responsible for the site homepage, public capabilities, main and sub-accounts, unified login, and API gateway. It provides merchant-side sites for local and cross-border stores, and efficient operational tools for operations teams.
        - Designed and implemented modules such as exchange rates, announcements, pop-ups, review systems, and sidebars. Optimized and maintained questionnaire systems, feature toggle projects, and operational platforms.
        - Participated in the OpenResty API gateway development, handling large amounts of traffic, designing and maintaining internal plugins.
      ],
      zh: cventry(
        bl: [Shopee 卖家平台，后端],
        br: [#translate-date(7, 2021) -- #translate-date(1, 2023)],
      )[
        - 业务介绍：卖家平台负责站点首页、公共能力、主子账号、统一登录和 API 网关等方向，为本地和跨境店铺提供商家端站点，为运营提供高效运营工具。
        - 负责设计并实现汇率、公告、弹窗、审核系统、侧边栏等模块，维护问卷系统、功能开关和运营平台等服务。
        - 参与 OpenResty API 网关开发，处理大量业务流量，设计和维护内部插件。
      ],
    )

    translate(
      en: cventry(
        bl: [*Shopee Open Platform*, Backend Development],
        br: [#translate-date(1, 2023) -- #current],
      )[
        - Business overview: The open platform provides portal sites, OpenAPI authentication and authorization, message push, and sandbox environment, offering stable and high-performance open platform capabilities.
        - Responsible for gateway, console, onboarding, review, and push systems modules. Improved system stability and performance, expanded console functionality, and enhanced user experience.
        - Participated in business technology development, including regional splitting, remote disaster recovery, observability, project refactoring, service governance, cost reduction and efficiency improvement, and framework integration.
      ],
      zh: cventry(
        bl: [Shopee 开放平台（同组不同业务），后端],
        br: [#translate-date(1, 2023) -- #current],
      )[
        - 业务介绍：开放平台提供门户站点、OpenAPI 鉴权授权、消息推送和沙箱环境等业务，提供稳定高性能的开放平台能力。
        - 负责网关、控制台、入驻、审核和推送系统等模块，提升系统稳定性和性能，扩展控制台功能，提升使用体验。
        - 参与业务技术方向开发，如地区拆分、异地灾备、可观测性、项目重构、服务治理、降本增效和框架接入等。
      ],
    )
  }

  let gateway = {
    cventry(
      tl: [API Gateway],
    )[]

    translate(
      en: [
        - Developed multiple core functional modules based on plugin architecture, including ACL, authentication, and data masking plugins, improving system flexibility and scalability.
        - Designed and implemented a high-throughput (60k+ QPS) developer call log reporting system, providing data support for downstream analysis systems.
        - Implemented a high-performance JSON structure rule processing library, achieving precise control over complex nested objects and arrays, effectively applied to log masking and API sensitive data processing.
      ],
      zh: [
        - 基于插件架构开发多个核心功能模块，包括 ACL、鉴权和数据脱敏插件，提高系统灵活性和可扩展性。
        - 设计并实现高吞吐量（60k+ QPS）的开发者调用日志上报系统，为下游分析系统提供数据支持。
        - 实现高性能 JSON 结构规则处理库，实现对复杂嵌套对象和数组的精确控制，有效应用于日志脱敏和 API 敏感数据处理。
      ],
    )
  }

  let openservice = {
    cventry(
      tl: [Open Service],
      tr: link("https://open.shopee.com/"),
    )[]

    translate(
      en: [
        - Improved system performance and stability: Optimized authentication process (P95 latency 15->8ms), added smooth transition mechanisms and authentication degradation strategies, optimized page loading (some delays reduced by 90%).
        - Optimized push system based on regional splitting, effectively reducing cross-region push latency. Developed speed test functionality to assist developers in selecting optimal push servers.
        - Enhanced console functionality, adding multiple modules such as statistics dashboard, business analysis, log search, vulnerability monitoring, and penalty system, comprehensively improving platform functionality and user experience.
      ],
      zh: [
        - 提升系统性能与稳定性：优化鉴权流程（P95 延迟 15->8ms），添加平滑过渡机制和鉴权降级策略，优化页面加载（部分延迟降低 90%）。
        - 基于地区拆分方案优化推送系统，有效缩减跨区推送耗时（800->20ms），开发测速功能协助开发者选择最佳推送服务器。
        - 增强控制台功能，新增统计看板、商业分析、日志搜索、漏洞监控、惩罚系统等多个模块，全面提升平台功能与用户体验。
      ],
    )
  }


  let sellermisc = {
    cventry(
      tl: [Seller Service],
      tr: link("https://seller.shopee.co.id/"),
    )[]

    translate(
      en: [
        - Core components include unified pop-ups and sidebars, extensively using asynchronous loading, caching, and message queues, significantly improving seller-side user experience.
        - Feature toggle system supports fine-grained blacklist and whitelist management, version control, and rollback, widely applied in business, improving product iteration efficiency and operational flexibility.
      ],
      zh: [
        - 包含统一弹窗和侧边栏等核心组件，广泛采用了异步加载、缓存和消息队列等技术，显著提升卖家端用户体验。
        - 功能开关系统支持精细化的黑白名单管理、版本控制和回滚，在业务中广泛应用，提高产品迭代效率和运营灵活性。
      ],
    )
  }

  let partnervoucher = {
    cventry(
      tl: [Partner Voucher],
      tr: link("https://partnervoucher.shopee.co.id/"),
    )[]

    translate(
      en: [
        - Enterprise coupon gift-card management platform, providing organization management, balance, order, and approval flow functionalities. Accumulated hundreds of thousands of dollars in recharges since launch.
        - Independently completed platform backend design and development, responsible for cross-team project development promotion, timely progress management, ensuring on-schedule project launch.
      ],
      zh: [
        - 企业优惠券购买管理平台，提供组织管理、余额、订单和审批流等功能。上线以来累计充值数百万美元。
        - 独立完成平台后端设计与开发，负责跨团队推进项目开发部分，及时管理进度，保障项目如期上线。
      ],
    )
  }

  let gnar = {
    cventry(
      tl: [Gnar],
      tr: githublink("abcdlsj/gnar"),
    )[]

    translate(
      en: [
        - Intranet port forwarding tool, similar to Frp/Ngork
        - Forwarding protocol support TCP/UDP,using Yamux support multiplexing
      ],
      zh: [
        - 内网端口转发工具，类似于 Frp/Ngork，转发协议支持 TCP/UDP，使用 Yamux 支持连接多路复用。
      ],
    )
  }

  let cLsm = {
    cventry(
      tl: [cLSM],
      tr: githublink("abcdlsj/clsm"),
    )[]

    translate(
      en: [
        - A LSM-Tree data structure implementation based on SkipList
      ],
      zh: [
        - 基于 SkipList 的 LSM-Tree 数据结构实现（BloomFilter、SkipList）。
      ],
    )
  }

  let skills = {

    let progLang = {
      translate(
        en: [
          - Programming language: Very familiar with Go, familiar with Python, Lua, C++, Rust.
        ],
        zh: [
          - 编程语言：熟悉 Go，了解 Python、Lua、C++、Rust，熟悉算法与数据结构。
        ],
      )
    }
    let systemNetwork = {
      translate(
        en: [- System and network: Familiar with operating system and network protocols.],
        zh: [- 操作系统 \& 网络：熟悉操作系统，包括进程、内存、Linux、多路复用、容器化技术。熟悉常见网络协议。],
      )
    }
    let middles = {
      translate(
        en: [
          - Middle: Good at using daily tools and scripts, with experience in Jira, Gitlab, Confluence.
        ],
        zh: [
          - 中间件：熟悉 MySQL、Redis、Kafka 的使用和原理，有 Elasticsearch、Clickhouse、RabbitMQ 使用经验。
        ],
      )
    }
    let devTools = {
      translate(
        en: [- Development tools: Good at using daily tools and scripts, with experience in Jira, Gitlab, Confluence.],
        zh: [- 开发工具：善于使用日常工具和脚本，熟悉 Jira、Gitlab、Confluence 等团队协作工具。],
      )
    }

    let commus = {
      translate(
        en: [
          - Communication: Have strong communication skills and experience with cross-department communication and project management.
        ],
        zh: [
          - 沟通\&协作：具有独立设计和实施解决方案的能力，善于跨部门协作与沟通，有效管理项目进度并确保按时交付。
        ]
      )
    }
    progLang
    systemNetwork
    middles
    devTools
    commus
  }

  let misc = {
    translate(
      en: [
        - I am very interested in sharing and recording
      ],
      zh: [
        - 喜欢折腾和探索不同领域的技术，热爱分享和记录。
      ],
    )
  }

  translate(en: [= #smallcaps[Songjian Li]], zh: [= 李松健])

  [#emaillink("career@songjian.li") $dot.c$ #iconlink(
      "+86 17356375549",
      icon: phone,
    ) $dot.c$ #iconlink(
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
  gateway
  sellermisc
  partnervoucher

  translate(en: [== Personal Projects], zh: [== 个人项目])
  gnar
  cLsm

  translate(en: [== Skills], zh: [== 技能])
  skills

  translate(en: [== Misc], zh: [== 其它])
  misc
}
